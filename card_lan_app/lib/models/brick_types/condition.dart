/// A [BrickCondition] gates whether a triggered brick's effect runs, e.g.
/// "cardRankEquals", "isPlayersTurn". Evaluated by the rule engine against
/// the current [GameState].
class BrickCondition {
  final String type;
  final Map<String, dynamic> params;

  const BrickCondition({required this.type, this.params = const {}});

  factory BrickCondition.fromJson(Map<String, dynamic> json) =>
      BrickCondition(
        type: json['type'] as String,
        params: (json['params'] as Map<String, dynamic>?) ?? const {},
      );

  Map<String, dynamic> toJson() => {'type': type, 'params': params};
}
