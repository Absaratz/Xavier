/// A [BrickEffect] mutates [GameState] once its trigger fires and its
/// conditions pass, e.g. "drawCards", "skipNextPlayer", "reverseTurnOrder".
class BrickEffect {
  final String type;
  final Map<String, dynamic> params;

  const BrickEffect({required this.type, this.params = const {}});

  factory BrickEffect.fromJson(Map<String, dynamic> json) => BrickEffect(
        type: json['type'] as String,
        params: (json['params'] as Map<String, dynamic>?) ?? const {},
      );

  Map<String, dynamic> toJson() => {'type': type, 'params': params};
}
