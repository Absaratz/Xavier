import 'package:flutter_test/flutter_test.dart';
import 'package:card_lan_app/engine/brick_interpreter.dart';
import 'package:card_lan_app/engine/builtin_bricks/conditions/condition_registry.dart';
import 'package:card_lan_app/engine/builtin_bricks/effects/effect_registry.dart';
import 'package:card_lan_app/engine/rule_engine.dart';
import 'package:card_lan_app/models/brick.dart';
import 'package:card_lan_app/models/brick_types/condition.dart';
import 'package:card_lan_app/models/brick_types/effect.dart';
import 'package:card_lan_app/models/brick_types/trigger.dart';
import 'package:card_lan_app/models/game_state.dart';
import 'package:card_lan_app/models/player.dart';
import 'package:card_lan_app/models/ruleset.dart';

void main() {
  test('brick with matching trigger and condition skips the next player', () {
    final ruleset = Ruleset(
      id: 'test',
      name: 'Test ruleset',
      bricks: [
        Brick(
          id: 'b1',
          label: 'Jack skips',
          trigger: const BrickTrigger(type: 'onCardPlayed'),
          conditions: const [
            BrickCondition(type: 'cardRankEquals', params: {'rank': 'J'}),
          ],
          effects: const [BrickEffect(type: 'skipNextPlayer')],
        ),
      ],
    );

    final engine = RuleEngine(
      ruleset: ruleset,
      interpreter: BrickInterpreter(
        conditionRegistry: ConditionRegistry(),
        effectRegistry: EffectRegistry(),
      ),
    );

    final state = GameState(
      matchId: 'm1',
      rulesetId: 'test',
      players: const [
        Player(id: 'p1', name: 'A', hand: []),
        Player(id: 'p2', name: 'B', hand: []),
        Player(id: 'p3', name: 'C', hand: []),
      ],
      drawPile: const [],
      discardPile: const [],
      currentPlayerId: 'p1',
    );

    final nextState = engine.dispatch(
      state: state,
      eventType: 'onCardPlayed',
      eventData: {'playerId': 'p1', 'cardRank': 'J'},
    );

    expect(nextState.currentPlayerId, 'p3');
  });
}
