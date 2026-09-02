import 'triggers/trigger_types.dart';

/// How a [ParamSpec]'s value should be edited in the rules-builder UI.
enum ParamKind { integer, text, cardRank }

/// One configurable input on a trigger/condition/effect, e.g. the "rank"
/// a `cardRankEquals` condition compares against. Purely UI metadata — the
/// engine handlers in `conditions/` and `effects/` read these same keys
/// straight out of the brick's `params` map at runtime.
class ParamSpec {
  final String key;
  final String label;
  final ParamKind kind;
  final Object? defaultValue;

  const ParamSpec({
    required this.key,
    required this.label,
    required this.kind,
    this.defaultValue,
  });
}

class TriggerDef {
  final String type;
  final String label;

  const TriggerDef({required this.type, required this.label});
}

class ConditionDef {
  final String type;
  final String label;
  final List<ParamSpec> params;

  const ConditionDef({
    required this.type,
    required this.label,
    this.params = const [],
  });
}

class EffectDef {
  final String type;
  final String label;
  final List<ParamSpec> params;

  const EffectDef({
    required this.type,
    required this.label,
    this.params = const [],
  });
}

/// Display metadata for every built-in trigger/condition/effect, driving the
/// rules-builder pickers. Adding a new handler under `builtin_bricks/`
/// means adding its matching entry here so it shows up in the UI.
class BrickCatalog {
  BrickCatalog._();

  static const List<String> cardRanks = [
    'A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K',
  ];

  static const List<TriggerDef> triggers = [
    TriggerDef(type: TriggerTypes.onCardPlayed, label: 'A card is played'),
    TriggerDef(type: TriggerTypes.onTurnStart, label: 'A turn starts'),
    TriggerDef(type: TriggerTypes.onTurnEnd, label: 'A turn ends'),
    TriggerDef(type: TriggerTypes.onDeckEmpty, label: 'The draw pile empties'),
    TriggerDef(type: TriggerTypes.onPlayerJoined, label: 'A player joins'),
    TriggerDef(type: TriggerTypes.onMatchStart, label: 'The match starts'),
  ];

  static const List<ConditionDef> conditions = [
    ConditionDef(
      type: 'cardRankEquals',
      label: 'Played card rank equals…',
      params: [
        ParamSpec(key: 'rank', label: 'Rank', kind: ParamKind.cardRank, defaultValue: 'A'),
      ],
    ),
    ConditionDef(
      type: 'isPlayersTurn',
      label: "It's the acting player's turn",
    ),
  ];

  static const List<EffectDef> effects = [
    EffectDef(
      type: 'drawCards',
      label: 'Acting player draws cards',
      params: [
        ParamSpec(key: 'count', label: 'Number of cards', kind: ParamKind.integer, defaultValue: 1),
      ],
    ),
    EffectDef(
      type: 'skipNextPlayer',
      label: 'Skip the next player',
    ),
  ];

  static TriggerDef triggerFor(String type) =>
      triggers.firstWhere((def) => def.type == type);

  static ConditionDef conditionFor(String type) =>
      conditions.firstWhere((def) => def.type == type);

  static EffectDef effectFor(String type) =>
      effects.firstWhere((def) => def.type == type);
}
