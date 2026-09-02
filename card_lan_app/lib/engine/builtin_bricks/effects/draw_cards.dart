import '../../../models/game_state.dart';
import '../../../models/player.dart';

/// params: {"count": 2, "targetPlayerId": "..."} — moves cards from the
/// draw pile into the target player's hand.
GameState drawCardsEffect(
  GameState state,
  Map<String, dynamic> params,
  Map<String, dynamic> eventData,
) {
  final count = params['count'] as int? ?? 1;
  final targetPlayerId =
      params['targetPlayerId'] as String? ?? eventData['playerId'] as String;

  final drawn = state.drawPile.take(count).toList();
  final remainingDraw = state.drawPile.skip(count).toList();

  final players = state.players.map((p) {
    if (p.id != targetPlayerId) return p;
    return Player(
      id: p.id,
      name: p.name,
      hand: [...p.hand, ...drawn],
      isHost: p.isHost,
      isConnected: p.isConnected,
    );
  }).toList();

  return state.copyWith(players: players, drawPile: remainingDraw);
}
