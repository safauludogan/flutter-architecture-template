import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

typedef NetworkCallback = void Function(NetworkResult result);

abstract class INetworkChangeManager {
  void handleNetworkChange(NetworkCallback onChange);
  Future<NetworkResult> checkConnectivityFirstTime();
  void dispose();
}

class NetworkChangeManager extends INetworkChangeManager {
  NetworkChangeManager() {
    _connectivity = Connectivity();
  }
  late final Connectivity _connectivity;
  late StreamSubscription<ConnectivityResult>? _subscription;
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
      await _connectivity.checkConnectivity(),
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
  }
}

enum NetworkResult {
  on,
  off;

  static NetworkResult checkConnectivityResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
      case ConnectivityResult.vpn:
      case ConnectivityResult.other:
        return NetworkResult.on;
      case ConnectivityResult.none:
        return NetworkResult.off;
    }
  }
}
