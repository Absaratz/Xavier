import 'card_model.dart';
import 'player.dart';

/// The single source of truth for a match, owned by the host and broadcast
/// to clients after every applied action. Clients never mutate this locally.
class GameState {
  final String matchId;
  final String rulesetId;
  final List<Player> players;
  final List<CardModel> drawPile;
  final List<CardModel> discardPile;
  final String currentPlayerId;
  final bool turnClockwise;
  final Map<String, dynamic> customState;
  final int version;

  const GameState({
    required this.matchId,
    required this.rulesetId,
    required this.players,
    required this.drawPile,
    required this.discardPile,
    required this.currentPlayerId,
    this.turnClockwise = true,
    this.customState = const {},
    this.version = 0,
  });

  factory GameState.fromJson(Map<String, dynamic> json) => GameState(
        matchId: json['matchId'] as String,
        rulesetId: json['rulesetId'] as String,
        players: (json['players'] as List)
            .map((e) => Player.fromJson(e as Map<String, dynamic>))
            .toList(),
        drawPile: (json['drawPile'] as List)
            .map((e) => CardModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        discardPile: (json['discardPile'] as List)
            .map((e) => CardModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        currentPlayerId: json['currentPlayerId'] as String,
        turnClockwise: json['turnClockwise'] as bool? ?? true,
        customState:
            (json['customState'] as Map<String, dynamic>?) ?? const {},
        version: json['version'] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'matchId': matchId,
        'rulesetId': rulesetId,
        'players': players.map((p) => p.toJson()).toList(),
        'drawPile': drawPile.map((c) => c.toJson()).toList(),
        'discardPile': discardPile.map((c) => c.toJson()).toList(),
        'currentPlayerId': currentPlayerId,
        'turnClockwise': turnClockwise,
        'customState': customState,
        'version': version,
      };

  GameState copyWith({
    List<Player>? players,
    List<CardModel>? drawPile,
    List<CardModel>? discardPile,
    String? currentPlayerId,
    bool? turnClockwise,
    Map<String, dynamic>? customState,
    int? version,
  }) {
    return GameState(
      matchId: matchId,
      rulesetId: rulesetId,
      players: players ?? this.players,
      drawPile: drawPile ?? this.drawPile,
      discardPile: discardPile ?? this.discardPile,
      currentPlayerId: currentPlayerId ?? this.currentPlayerId,
      turnClockwise: turnClockwise ?? this.turnClockwise,
      customState: customState ?? this.customState,
      version: version ?? this.version + 1,
    );
  }
}
