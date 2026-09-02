import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// TODO: spin up a GameHostServer on localhost, connect a GameClient to it,
// and assert a full join -> action -> state_sync round trip. This exercises
// the real dart:io HttpServer/WebSocket path used on-device.

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('client can join a locally hosted match', (tester) async {
    // TODO
  }, skip: true);
}
