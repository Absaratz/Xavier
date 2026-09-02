import 'card_model.dart';

class Player {
  final String id;
  final String name;
  final List<CardModel> hand;
  final bool isHost;
  final bool isConnected;

  const Player({
    required this.id,
    required this.name,
    required this.hand,
    this.isHost = false,
    this.isConnected = true,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json['id'] as String,
        name: json['name'] as String,
        hand: (json['hand'] as List)
            .map((e) => CardModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        isHost: json['isHost'] as bool? ?? false,
        isConnected: json['isConnected'] as bool? ?? true,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'hand': hand.map((c) => c.toJson()).toList(),
        'isHost': isHost,
        'isConnected': isConnected,
      };
}
