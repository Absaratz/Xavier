import '../../models/card_model.dart';

/// A standard 52-card deck, unshuffled. `DeckBuilder.shuffled()` wraps this
/// with a Fisher-Yates shuffle for actual game use.
List<CardModel> buildStandardDeck() {
  const ranks = [
    'A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K',
  ];
  final cards = <CardModel>[];
  var index = 0;
  for (final suit in [
    CardSuit.hearts,
    CardSuit.diamonds,
    CardSuit.clubs,
    CardSuit.spades,
  ]) {
    for (final rank in ranks) {
      cards.add(CardModel(id: 'card_${index++}', suit: suit, rank: rank));
    }
  }
  return cards;
}
