/// Engine-recognized [BrickTrigger.type] values. The engine fires these by
/// name from `GameController`; a ruleset's bricks subscribe to them.
class TriggerTypes {
  TriggerTypes._();

  static const String onCardPlayed = 'onCardPlayed';
  static const String onTurnStart = 'onTurnStart';
  static const String onTurnEnd = 'onTurnEnd';
  static const String onDeckEmpty = 'onDeckEmpty';
  static const String onPlayerJoined = 'onPlayerJoined';
  static const String onMatchStart = 'onMatchStart';
}
