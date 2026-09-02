import 'dart:math';

import '../../models/card_model.dart';
import 'standard_deck.dart';

class DeckBuilder {
  DeckBuilder._();

  static List<CardModel> shuffled({Random? random}) {
    final deck = buildStandardDeck();
    deck.shuffle(random ?? Random());
    return deck;
  }
}
