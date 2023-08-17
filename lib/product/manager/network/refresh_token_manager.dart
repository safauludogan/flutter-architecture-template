import 'package:dio/dio.dart';

abstract class IRefreshTokenManager {
  Future<DioException> refresh();
}

class RefreshTokenManager extends IRefreshTokenManager {
  RefreshTokenManager(this.error, this.options);
  DioException error;
  BaseOptions options;

  @override
  Future<DioException> refresh() async {
    return DioException(requestOptions: RequestOptions(path: 's'));
  }
}
