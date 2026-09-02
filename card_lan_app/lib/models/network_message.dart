/// Envelope for every message exchanged over the WebSocket link, in both
/// directions. [type] selects the payload shape (see
/// `network/protocol/message_types.dart`).
class NetworkMessage {
  final String type;
  final Map<String, dynamic> payload;

  const NetworkMessage({required this.type, required this.payload});

  factory NetworkMessage.fromJson(Map<String, dynamic> json) =>
      NetworkMessage(
        type: json['type'] as String,
        payload: (json['payload'] as Map<String, dynamic>?) ?? const {},
      );

  Map<String, dynamic> toJson() => {'type': type, 'payload': payload};
}
