import '../models/brick.dart';
import '../models/game_state.dart';
import '../models/ruleset.dart';
import 'brick_interpreter.dart';

/// Interprets a [Ruleset]'s bricks against the current [GameState].
/// Runs only on the host: it is the single source of truth for what a
/// requested action does to the game.
class RuleEngine {
  final Ruleset ruleset;
  final BrickInterpreter interpreter;

  RuleEngine({required this.ruleset, required this.interpreter});

  /// Applies every brick whose trigger matches [eventType] and whose
  /// conditions pass, in ruleset order, folding each effect into the state.
  GameState dispatch({
    required GameState state,
    required String eventType,
    required Map<String, dynamic> eventData,
  }) {
    var nextState = state;

    for (final Brick brick in ruleset.bricks) {
      if (brick.trigger.type != eventType) continue;

      final conditionsMet = brick.conditions.every(
        (condition) => interpreter.evaluateCondition(
          condition: condition,
          state: nextState,
          eventData: eventData,
        ),
      );
      if (!conditionsMet) continue;

      for (final effect in brick.effects) {
        nextState = interpreter.applyEffect(
          effect: effect,
          state: nextState,
          eventData: eventData,
        );
      }
    }

    return nextState;
  }
}
