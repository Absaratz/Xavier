import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../engine/builtin_bricks/triggers/trigger_types.dart';
import '../engine/rule_engine.dart';
import '../engine/validators/action_validator.dart';
import '../models/game_state.dart';
import '../models/network_message.dart';
import '../models/player.dart';
import '../network/protocol/message_types.dart';

/// Runs on the host only. Owns the canonical [GameState], validates every
/// action request, dispatches it through the [RuleEngine], and pushes the
/// resulting state to all clients via the broadcast callback.
class GameController {
  final RuleEngine ruleEngine;
  final ActionValidator validator;
  final void Function(NetworkMessage message) broadcast;
  final void Function(String playerId, NetworkMessage message) sendTo;

  GameState state;
  final _uuid = const Uuid();

  GameController({
    required this.ruleEngine,
    required this.validator,
    required this.state,
    required this.broadcast,
    required this.sendTo,
  });

  String registerPlayer({
    required String name,
    required WebSocketChannel channel,
  }) {
    final playerId = _uuid.v4();
    final player = Player(id: playerId, name: name, hand: const []);

    state = state.copyWith(players: [...state.players, player]);

    sendTo(playerId, NetworkMessage(
      type: MessageTypes.joinAccepted,
      payload: {'playerId': playerId, 'state': state.toJson()},
    ));
    broadcast(NetworkMessage(
      type: MessageTypes.playerJoined,
      payload: {'player': player.toJson()},
    ));

    state = ruleEngine.dispatch(
      state: state,
      eventType: TriggerTypes.onPlayerJoined,
      eventData: {'playerId': playerId},
    );
    _syncAll();

    return playerId;
  }

  void removePlayer(String playerId) {
    state = state.copyWith(
      players: state.players.where((p) => p.id != playerId).toList(),
    );
    broadcast(NetworkMessage(
      type: MessageTypes.playerLeft,
      payload: {'playerId': playerId},
    ));
  }

  void handleAction(Map<String, dynamic> action) {
    final result = validator.validate(state: state, action: action);
    if (!result.isValid) {
      final playerId = action['playerId'] as String?;
      if (playerId != null) {
        sendTo(playerId, NetworkMessage(
          type: MessageTypes.actionRejected,
          payload: {'reason': result.reason},
        ));
      }
      return;
    }

    state = ruleEngine.dispatch(
      state: state,
      eventType: TriggerTypes.onCardPlayed,
      eventData: action,
    );
    _syncAll();
  }

  void _syncAll() {
    broadcast(NetworkMessage(
      type: MessageTypes.stateSync,
      payload: {'state': state.toJson()},
    ));
  }
}
