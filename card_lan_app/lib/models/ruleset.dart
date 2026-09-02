import 'brick.dart';

/// A saved, shareable game definition: metadata plus an ordered list of
/// [Brick]s. The rule engine interprets this directly, with no game-specific
/// Dart code required.
class Ruleset {
  final String id;
  final String name;
  final String description;
  final int minPlayers;
  final int maxPlayers;
  final List<Brick> bricks;

  const Ruleset({
    required this.id,
    required this.name,
    this.description = '',
    this.minPlayers = 2,
    this.maxPlayers = 6,
    required this.bricks,
  });

  factory Ruleset.fromJson(Map<String, dynamic> json) => Ruleset(
        id: json['id'] as String,
        name: json['name'] as String,
        description: json['description'] as String? ?? '',
        minPlayers: json['minPlayers'] as int? ?? 2,
        maxPlayers: json['maxPlayers'] as int? ?? 6,
        bricks: (json['bricks'] as List)
            .map((e) => Brick.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'minPlayers': minPlayers,
        'maxPlayers': maxPlayers,
        'bricks': bricks.map((b) => b.toJson()).toList(),
      };
}
