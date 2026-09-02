/// Everything a client needs to reach the host: encoded into the QR code
/// and parseable from a manually typed IP as a fallback.
class ConnectionInfo {
  final String host;
  final int port;

  const ConnectionInfo({required this.host, required this.port});

  /// Payload embedded in the pairing QR code, e.g. `cardlan://192.168.1.5:51820`.
  String toQrPayload() => 'cardlan://$host:$port';

  static ConnectionInfo? fromQrPayload(String payload) {
    final uri = Uri.tryParse(payload);
    if (uri == null || uri.scheme != 'cardlan' || uri.host.isEmpty) {
      return null;
    }
    return ConnectionInfo(host: uri.host, port: uri.hasPort ? uri.port : 51820);
  }

  Uri toWebSocketUri() => Uri.parse('ws://$host:$port/ws');
}
