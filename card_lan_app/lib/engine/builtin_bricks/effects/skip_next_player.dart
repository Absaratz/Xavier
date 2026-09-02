import '../../../models/game_state.dart';

/// Advances [GameState.currentPlayerId] by two seats instead of one,
/// honoring [GameState.turnClockwise].
GameState skipNextPlayerEffect(
  GameState state,
  Map<String, dynamic> params,
  Map<String, dynamic> eventData,
) {
  final ids = state.players.map((p) => p.id).toList();
  final currentIndex = ids.indexOf(state.currentPlayerId);
  final step = state.turnClockwise ? 2 : -2;
  final nextIndex = (currentIndex + step) % ids.length;
  final normalizedIndex = nextIndex < 0 ? nextIndex + ids.length : nextIndex;

  return state.copyWith(currentPlayerId: ids[normalizedIndex]);
}
