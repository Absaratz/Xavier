enum CardSuit { hearts, diamonds, clubs, spades, none }

class CardModel {
  final String id;
  final CardSuit suit;
  final String rank;

  const CardModel({required this.id, required this.suit, required this.rank});

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        id: json['id'] as String,
        suit: CardSuit.values.byName(json['suit'] as String),
        rank: json['rank'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'suit': suit.name,
        'rank': rank,
      };
}
