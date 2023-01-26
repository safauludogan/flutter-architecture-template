import 'package:flutter_architecture_template/core/constants/project_items.dart';
import 'package:vexana/vexana.dart';

import 'refresh_token_manager.dart';

class VexanaManager {
  VexanaManager._();
  static VexanaManager? _instance;
  static VexanaManager get instance {
    _instance ??= VexanaManager._();
    return _instance!;
  }

  static IRefreshTokenManager? _refreshTokenManager;
  INetworkManager networkManager = NetworkManager<EmptyModel>(
      isEnableLogger: true,
      isEnableTest: true,
      onRefreshToken: (error, newService) {
        _refreshTokenManager ??= RefreshTokenManager();
        return _refreshTokenManager!.refresh();
      },
      options: BaseOptions(
          connectTimeout: 8000,
          baseUrl: ProjectItems.baseUrl,
          followRedirects: true));
}
