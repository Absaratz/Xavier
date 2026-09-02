import '../models/brick_types/condition.dart';
import '../models/brick_types/effect.dart';
import '../models/game_state.dart';
import 'builtin_bricks/conditions/condition_registry.dart';
import 'builtin_bricks/effects/effect_registry.dart';

/// Looks up a [BrickCondition]/[BrickEffect]'s `type` in the built-in
/// registries and runs the matching handler. Adding a new brick type means
/// registering a handler here, not touching the engine dispatch loop.
class BrickInterpreter {
  final ConditionRegistry conditionRegistry;
  final EffectRegistry effectRegistry;

  BrickInterpreter({
    required this.conditionRegistry,
    required this.effectRegistry,
  });

  bool evaluateCondition({
    required BrickCondition condition,
    required GameState state,
    required Map<String, dynamic> eventData,
  }) {
    final handler = conditionRegistry.resolve(condition.type);
    return handler(state, condition.params, eventData);
  }

  GameState applyEffect({
    required BrickEffect effect,
    required GameState state,
    required Map<String, dynamic> eventData,
  }) {
    final handler = effectRegistry.resolve(effect.type);
    return handler(state, effect.params, eventData);
  }
}
