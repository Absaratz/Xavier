# Card LAN

Cross-platform (Android + iOS) LAN card game app. One phone hosts an
embedded WebSocket server; other phones join over the same Wi-Fi network
(hotspot or shared router) by scanning a QR code or typing an IP. The host
runs the only copy of the game state and a data-driven rule engine; clients
are thin renderers.

## Getting started

`android/` and `ios/` are committed, generated via `flutter create
--platforms=android,ios --org com.cardlan .` (application id
`com.cardlan.card_lan_app`, rename it in `android/app/build.gradle.kts` /
`ios/Runner.xcodeproj` if you want something else). From inside
`card_lan_app/`:

```
flutter pub get
flutter test
flutter run
```

Required platform permissions are already declared:

- **Android** (`android/app/src/main/AndroidManifest.xml`): `INTERNET`,
  `ACCESS_WIFI_STATE`, `ACCESS_NETWORK_STATE`, `CAMERA` (QR scanning), and
  `ACCESS_FINE_LOCATION` (some OEMs require it to read the Wi-Fi IP via
  `network_info_plus`).
- **iOS** (`ios/Runner/Info.plist`): `NSCameraUsageDescription` (QR
  scanning) and `NSLocalNetworkUsageDescription` (required since iOS 14 for
  any LAN socket/HTTP server traffic).

## Architecture

- **`lib/network/host/`** — `dart:io` `HttpServer` + WebSocket server run
  in-process on the host phone. No native plugin bridge needed on either
  platform.
- **`lib/network/client/`** — thin WebSocket client used by every non-host
  phone, host included (the host also runs a local client instance against
  itself, though that's wired up at the screen layer).
- **`lib/network/discovery/`** — QR-code pairing (`ConnectionInfo` encoded
  as `cardlan://ip:port`) with manual IP entry as a fallback. No mDNS.
- **`lib/models/`** — shared, JSON-serializable data: `GameState`,
  `Player`, `CardModel`, `Ruleset`, and the three brick pieces
  (`BrickTrigger`, `BrickCondition`, `BrickEffect`).
- **`lib/engine/`** — the rule engine. `RuleEngine.dispatch()` walks a
  ruleset's bricks for a given event; `BrickInterpreter` resolves each
  brick's condition/effect type against the registries under
  `builtin_bricks/`. New rule behavior is a new handler function registered
  in `condition_registry.dart` / `effect_registry.dart`, not a new game.
- **`lib/game/`** — `GameController` is host-only and authoritative: it
  validates actions, dispatches them through the rule engine, and pushes
  the resulting `GameState` to every client.
- **`lib/state/providers/`** — `provider`-based glue between the network
  layer and the UI (`ConnectionProvider`, `GameStateProvider`,
  `RulesetProvider`).
- **`lib/ui/`** — screens split by flow (`home`, `host`, `join`, `game`,
  `rules_builder`) plus shared widgets.
- **`lib/data/`** — bundled preset rulesets (`assets/rulesets/*.json`) and
  local persistence for user-created ones.

## Releasing

Pushing a tag matching `v*.*.*` (e.g. `v0.1.0`) triggers
`.github/workflows/release.yml`, which builds a release APK and App Bundle
and attaches them to a new GitHub Release named after the tag:

```
git tag v0.1.0
git push origin v0.1.0
```

The workflow builds Android only for now. iOS needs a macOS runner plus
Apple signing credentials as secrets — a follow-up once you're ready to
publish there too.

### Release signing

`android/app/build.gradle.kts` signs the release build with
`android/key.properties` when present, falling back to the debug key when
it isn't (so a plain `flutter build apk --release` still works with no
setup). The release workflow writes that file from four repo secrets, so
tagged builds come out Play-Store-signed once they're set:

| Secret | Value |
| --- | --- |
| `ANDROID_KEYSTORE_BASE64` | `base64 -w0 upload-keystore.jks` |
| `ANDROID_KEYSTORE_PASSWORD` | the keystore's store password |
| `ANDROID_KEY_ALIAS` | the key alias (`upload` by convention) |
| `ANDROID_KEY_PASSWORD` | the key password |

Add them under **Settings → Secrets and variables → Actions → New
repository secret**, or with the CLI:

```
base64 -w0 upload-keystore.jks | gh secret set ANDROID_KEYSTORE_BASE64 --repo <owner>/<repo>
gh secret set ANDROID_KEYSTORE_PASSWORD --repo <owner>/<repo> --body "..."
gh secret set ANDROID_KEY_ALIAS --repo <owner>/<repo> --body "upload"
gh secret set ANDROID_KEY_PASSWORD --repo <owner>/<repo> --body "..."
```

Keep the `.jks` file itself and its passwords somewhere safe outside the
repo (a password manager, not a commit) — anyone with them can sign
updates to your app, and losing them permanently blocks future Play Store
updates unless Play App Signing is enrolled to recover from it.

## Tests

- `test/` — unit tests for the rule engine, model JSON round-trips, and the
  network message codec. Run with `flutter test`.
- `integration_test/` — a stubbed end-to-end host/client round trip over a
  real local socket; fill in once the host server wiring is complete. Run
  with `flutter test integration_test`.
