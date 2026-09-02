import 'dart:convert';

import '../../models/network_message.dart';

/// Encodes/decodes [NetworkMessage]s to/from the JSON text frames sent over
/// the WebSocket connection.
class MessageCodec {
  MessageCodec._();

  static String encode(NetworkMessage message) => jsonEncode(message.toJson());

  static NetworkMessage decode(String raw) =>
      NetworkMessage.fromJson(jsonDecode(raw) as Map<String, dynamic>);
}
