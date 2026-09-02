# Card LAN

Cross-platform (Android + iOS) LAN card game app. One phone hosts an
embedded WebSocket server; other phones join over the same Wi-Fi network
(hotspot or shared router) by scanning a QR code or typing an IP. The host
runs the only copy of the game state and a data-driven rule engine; clients
are thin renderers.

## Getting started

This directory is the Flutter project structure (`lib/`, `test/`,
`pubspec.yaml`, assets) but was written without the Flutter SDK available in
this environment, so the platform folders (`android/`, `ios/`) are **not**
generated yet. Before building, run once from inside `card_lan_app/`:

```
flutter create --platforms=android,ios --project-name card_lan_app .
flutter pub get
```

This fills in `android/` and `ios/` around the existing `lib/`, keeping
everything already written here.

### Required platform permissions

Add these after `flutter create` regenerates the platform projects:

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

## Tests

- `test/` — unit tests for the rule engine, model JSON round-trips, and the
  network message codec. Run with `flutter test`.
- `integration_test/` — a stubbed end-to-end host/client round trip over a
  real local socket; fill in once the host server wiring is complete. Run
  with `flutter test integration_test`.
