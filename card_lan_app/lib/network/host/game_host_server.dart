import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../core/constants.dart';
import 'host_connection_manager.dart';

/// Runs the embedded LAN server on the host phone via `dart:io`'s
/// [HttpServer]. No native plugin bridge is needed — this process IS the
/// server. One instance per hosted match.
class GameHostServer {
  final HostConnectionManager connectionManager;
  HttpServer? _server;

  GameHostServer({required this.connectionManager});

  Future<int> start({int port = AppConstants.defaultHostPort}) async {
    final handler = webSocketHandler((WebSocketChannel channel, _) {
      connectionManager.handleNewConnection(channel);
    });

    final router = Cascade().add(handler).handler;
    _server = await shelf_io.serve(router, InternetAddress.anyIPv4, port);
    return _server!.port;
  }

  Future<void> stop() async {
    await _server?.close(force: true);
    _server = null;
  }
}
