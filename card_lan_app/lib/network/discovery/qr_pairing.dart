import 'package:network_info_plus/network_info_plus.dart';

import 'connection_info.dart';

/// Resolves the host phone's LAN-facing IP address (hotspot or shared
/// router, same code path either way) so it can be shown as a QR code.
class QrPairing {
  final NetworkInfo _networkInfo = NetworkInfo();

  Future<ConnectionInfo?> buildHostConnectionInfo(int port) async {
    final ip = await _networkInfo.getWifiIP();
    if (ip == null) return null;
    return ConnectionInfo(host: ip, port: port);
  }
}
