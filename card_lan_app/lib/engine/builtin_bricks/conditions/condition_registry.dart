import '../../../models/game_state.dart';
import 'card_rank_equals.dart';
import 'is_players_turn.dart';

typedef ConditionHandler = bool Function(
  GameState state,
  Map<String, dynamic> params,
  Map<String, dynamic> eventData,
);

/// Maps a [BrickCondition.type] string to its handler function. Register
/// new built-in conditions here as they're added under this directory.
class ConditionRegistry {
  final Map<String, ConditionHandler> _handlers = {
    'cardRankEquals': cardRankEqualsCondition,
    'isPlayersTurn': isPlayersTurnCondition,
  };

  ConditionHandler resolve(String type) {
    final handler = _handlers[type];
    if (handler == null) {
      throw ArgumentError('Unknown condition type: $type');
    }
    return handler;
  }

  void register(String type, ConditionHandler handler) {
    _handlers[type] = handler;
  }
}
