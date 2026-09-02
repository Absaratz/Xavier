import '../../../models/game_state.dart';
import 'draw_cards.dart';
import 'skip_next_player.dart';

typedef EffectHandler = GameState Function(
  GameState state,
  Map<String, dynamic> params,
  Map<String, dynamic> eventData,
);

/// Maps a [BrickEffect.type] string to its handler function. Register new
/// built-in effects here as they're added under this directory.
class EffectRegistry {
  final Map<String, EffectHandler> _handlers = {
    'drawCards': drawCardsEffect,
    'skipNextPlayer': skipNextPlayerEffect,
  };

  EffectHandler resolve(String type) {
    final handler = _handlers[type];
    if (handler == null) {
      throw ArgumentError('Unknown effect type: $type');
    }
    return handler;
  }

  void register(String type, EffectHandler handler) {
    _handlers[type] = handler;
  }
}
