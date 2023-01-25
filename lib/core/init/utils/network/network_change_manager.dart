import 'package:connectivity_plus/connectivity_plus.dart';

abstract class INetworkChangeManager {
  void handleNetworkChange(Function(NetworkResult result) onChange);
  Future<NetworkResult> checkConnectivityFirstTime();
}

class NetworkChangeManager extends INetworkChangeManager {
  late final Connectivity _connectivity;
  NetworkChangeManager() {
    _connectivity = Connectivity();
  }
  @override
  void handleNetworkChange(Function(NetworkResult result) onChange) {
    _connectivity.onConnectivityChanged.listen((connectivityResult) {
      onChange.call(NetworkResult.checkConnectivityResult(connectivityResult));
    });
  }

  @override
  Future<NetworkResult> checkConnectivityFirstTime() async {
    return NetworkResult.checkConnectivityResult(
        await _connectivity.checkConnectivity());
  }
}

enum NetworkResult {
  on,
  off;

  static NetworkResult checkConnectivityResult(
      ConnectivityResult connectivityResult) {
    switch (connectivityResult) {
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
      case ConnectivityResult.vpn:
        return NetworkResult.on;
      case ConnectivityResult.none:
        return NetworkResult.off;
    }
  }
}
