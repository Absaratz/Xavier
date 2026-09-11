import 'package:flutter_test/flutter_test.dart';
import 'package:card_lan_app/models/brick.dart';
import 'package:card_lan_app/models/brick_types/effect.dart';
import 'package:card_lan_app/models/brick_types/trigger.dart';

void main() {
  test('Brick round-trips through JSON', () {
    const brick = Brick(
      id: 'b1',
      label: 'Draw two',
      trigger: BrickTrigger(type: 'onCardPlayed'),
      effects: [BrickEffect(type: 'drawCards', params: {'count': 2})],
    );

    final decoded = Brick.fromJson(brick.toJson());

    expect(decoded.id, brick.id);
    expect(decoded.trigger.type, brick.trigger.type);
    expect(decoded.effects.single.params['count'], 2);
  });
}
