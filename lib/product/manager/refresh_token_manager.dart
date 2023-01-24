import 'package:dio/dio.dart';

abstract class IRefreshTokenManager {
  Future<DioError> refresh();
}

class RefreshTokenManager extends IRefreshTokenManager {
  @override
  Future<DioError> refresh() async {
    return DioError(requestOptions: RequestOptions(path: ''));
  }
}
