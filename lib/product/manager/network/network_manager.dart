import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/authentication_manager/authentication_manager.dart';
import 'package:flutter_architecture_template/product/manager/network/enum/network_headers_enum.dart';
import 'package:flutter_architecture_template/product/manager/network/interceptor/my_interceptor.dart';
import 'package:flutter_architecture_template/product/manager/network/refresh_token_manager.dart';

class NetworkManager {
  NetworkManager._init();
  static final NetworkManager _instance = NetworkManager._init();
  static NetworkManager get instance => _instance;

  late IDioNexusManager networkManager;

  Future<void> init(BuildContext context) async {
    networkManager = DioNexusManager(
      //printLogsDebugMode: false,
      onRefreshFail: () => AuthenticationManager().logOut(),
      onRefreshToken: (error, options) async =>
          RefreshTokenManager(error, options).refresh(),
      interceptor: MyInterceptor(),
      options: BaseOptions(
        headers: {NetworkHeadersEnum.ContentType.value: 'application/json'},
        receiveTimeout: const Duration(seconds: 15),
        connectTimeout: const Duration(seconds: 15),
      ),
      //connectTimeout: const Duration(milliseconds: 600)),
      locale: const Locale('tr'),
      networkConnection: NetworkConnection(
        context: context,
        snackbarDuration: const Duration(seconds: 5),
      ),
      timeoutToast: TimeoutToast(showException: true),
    );
  }
}
