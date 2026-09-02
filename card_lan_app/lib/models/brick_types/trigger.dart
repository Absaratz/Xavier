/// A [BrickTrigger] names the game event that arms a brick, e.g.
/// "onCardPlayed", "onTurnStart", "onDeckEmpty". Engine-defined trigger ids
/// live in `engine/builtin_bricks/triggers/`.
class BrickTrigger {
  final String type;
  final Map<String, dynamic> params;

  const BrickTrigger({required this.type, this.params = const {}});

  factory BrickTrigger.fromJson(Map<String, dynamic> json) => BrickTrigger(
        type: json['type'] as String,
        params: (json['params'] as Map<String, dynamic>?) ?? const {},
      );

  Map<String, dynamic> toJson() => {'type': type, 'params': params};
}
