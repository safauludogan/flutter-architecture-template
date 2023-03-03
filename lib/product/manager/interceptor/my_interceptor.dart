import 'package:dio/dio.dart';
import '../../../core/init/cache/locale_manager.dart';
import '../enum/network_headers_enum.dart';

class MyInterceptor implements InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    return handler.next(
      DioError(
          requestOptions: RequestOptions(path: err.requestOptions.path),
          error: err.response?.data.toString()),
    );
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var token = LocaleManager.instance.getStringValue(PreferencesKeys.token);
    if (token != null) {
      options.headers[NetworkHeadersEnum.Authorization.value] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
