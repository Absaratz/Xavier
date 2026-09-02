import 'package:flutter/foundation.dart';

import '../../models/game_state.dart';
import '../../models/network_message.dart';
import '../../network/protocol/message_types.dart';

/// Mirrors the host-broadcast [GameState] for the UI to render. Never
/// mutated locally except by applying an incoming `state_sync` message.
class GameStateProvider extends ChangeNotifier {
  GameState? state;

  void handleMessage(NetworkMessage message) {
    if (message.type != MessageTypes.stateSync) return;
    state = GameState.fromJson(
      message.payload['state'] as Map<String, dynamic>,
    );
    notifyListeners();
  }
}
