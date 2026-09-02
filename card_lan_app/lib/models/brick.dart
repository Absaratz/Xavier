import 'brick_types/condition.dart';
import 'brick_types/effect.dart';
import 'brick_types/trigger.dart';

/// One rule unit: when [trigger] fires and every [conditions] entry passes,
/// each [effects] entry is applied in order. Rulesets are ordered lists of
/// [Brick]s, which lets users compose a game's rules from a picker UI
/// instead of the app hardcoding each game.
class Brick {
  final String id;
  final String label;
  final BrickTrigger trigger;
  final List<BrickCondition> conditions;
  final List<BrickEffect> effects;

  const Brick({
    required this.id,
    required this.label,
    required this.trigger,
    this.conditions = const [],
    required this.effects,
  });

  factory Brick.fromJson(Map<String, dynamic> json) => Brick(
        id: json['id'] as String,
        label: json['label'] as String,
        trigger: BrickTrigger.fromJson(json['trigger'] as Map<String, dynamic>),
        conditions: (json['conditions'] as List? ?? [])
            .map((e) => BrickCondition.fromJson(e as Map<String, dynamic>))
            .toList(),
        effects: (json['effects'] as List)
            .map((e) => BrickEffect.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'trigger': trigger.toJson(),
        'conditions': conditions.map((c) => c.toJson()).toList(),
        'effects': effects.map((e) => e.toJson()).toList(),
      };
}
