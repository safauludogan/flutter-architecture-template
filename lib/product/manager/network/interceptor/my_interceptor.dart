import 'package:dio/dio.dart';
import 'package:flutter_architecture_template/core/init/cache/locale_manager.dart';
import 'package:flutter_architecture_template/product/manager/network/enum/network_headers_enum.dart';

class MyInterceptor implements InterceptorsWrapper {
  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    return handler.next(
      DioException(
          requestOptions: RequestOptions(path: err.requestOptions.path),
          error: err.response?.data.toString(),),
    );
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler,) async {
    final token = LocaleManager.instance.getStringValue(PreferencesKeys.token);
    if (token != null) {
      options.headers[NetworkHeadersEnum.Authorization.value] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  // ignore: strict_raw_type
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
