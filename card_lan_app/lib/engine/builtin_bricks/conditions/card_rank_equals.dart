import '../../../models/game_state.dart';

/// params: {"rank": "8"} — true when the played card's rank matches.
bool cardRankEqualsCondition(
  GameState state,
  Map<String, dynamic> params,
  Map<String, dynamic> eventData,
) {
  return eventData['cardRank'] == params['rank'];
}
