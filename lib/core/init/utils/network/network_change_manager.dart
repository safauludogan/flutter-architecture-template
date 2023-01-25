import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

typedef NetworkCallback = void Function(NetworkResult result);

abstract class INetworkChangeManager {
  void handleNetworkChange(NetworkCallback onChange);
  Future<NetworkResult> checkConnectivityFirstTime();
  void dispose();
}

class NetworkChangeManager extends INetworkChangeManager {
  late final Connectivity _connectivity;
  late StreamSubscription<ConnectivityResult>? _subscription;
  NetworkChangeManager() {
    _connectivity = Connectivity();
  }
  @override
  void handleNetworkChange(NetworkCallback onChange) {
    _subscription =
        _connectivity.onConnectivityChanged.listen((connectivityResult) {
      onChange.call(NetworkResult.checkConnectivityResult(connectivityResult));
    });
  }

  @override
  Future<NetworkResult> checkConnectivityFirstTime() async {
    return NetworkResult.checkConnectivityResult(
        await _connectivity.checkConnectivity());
  }

  @override
  void dispose() {
    _subscription?.cancel();
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
