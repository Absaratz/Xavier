import 'package:flutter/foundation.dart';

import '../../network/client/game_client.dart';
import '../../network/discovery/connection_info.dart';

enum ConnectionStatus { disconnected, connecting, connected, error }

/// Client-side connection state, consumed by the join/lobby screens.
class ConnectionProvider extends ChangeNotifier {
  final GameClient client = GameClient();

  ConnectionStatus status = ConnectionStatus.disconnected;
  String? errorMessage;
  String? playerId;

  Future<void> connectAndJoin(ConnectionInfo info, String playerName) async {
    status = ConnectionStatus.connecting;
    notifyListeners();
    try {
      await client.connect(info);
      client.join(playerName);
      status = ConnectionStatus.connected;
    } catch (e) {
      status = ConnectionStatus.error;
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<void> disconnect() async {
    await client.disconnect();
    status = ConnectionStatus.disconnected;
    notifyListeners();
  }
}
