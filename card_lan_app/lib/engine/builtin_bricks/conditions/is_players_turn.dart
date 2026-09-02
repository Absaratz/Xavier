import '../../../models/game_state.dart';

/// True when the acting player (from [eventData]) is [GameState.currentPlayerId].
bool isPlayersTurnCondition(
  GameState state,
  Map<String, dynamic> params,
  Map<String, dynamic> eventData,
) {
  return eventData['playerId'] == state.currentPlayerId;
}
