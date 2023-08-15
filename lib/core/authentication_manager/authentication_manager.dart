import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/init/cache/locale_manager.dart';
import 'package:flutter_architecture_template/core/init/main/main_init.dart';
import 'package:flutter_architecture_template/product/navigator/app_router.dart';
import '../../features/authentication/login/model/login_response_model.dart';
import '../constants/project_items.dart';
import '../init/toast/toast_service.dart';

class AuthenticationManager with ToastService {
  AuthenticationManager._();
  static final AuthenticationManager _instance = AuthenticationManager._();

  static AuthenticationManager get instance => _instance;

  void logOut({bool force = false}) async {
    try {
      await LocaleManager.instance.clearAll();
      getIt<AppRouter>().replace(const SplashRoute());
    } catch (error) {
      if (kDebugMode) {
        debugPrint(
            '***** DEBUG MODE ***** -- AuthenticationManager -- \n${error.toString()}');
      }
    } finally {}
  }

  void login(
      BuildContext context, LoginResponseModel loginResponseModel) async {
    try {
      await LocaleManager.instance.setStringValue(PreferencesKeys.token,
          value: loginResponseModel.token!);
      if (context.mounted) {
        showToast(label: ProjectItems.loginSuccess);
      }
      getIt<AppRouter>().replace(const HomeRoute());
    } catch (e) {
      if (kDebugMode) {
        debugPrint(
            '***** DEBUG MODE *****\nAuthenticationManager-login\n${e.toString()}');
      }
    }
  }

  bool checkLoginStatus() {
    var token = LocaleManager.instance.getStringValue(PreferencesKeys.token);
    if (token != null) {
      return true;
    }
    return false;
  }

  Future<void> updateToken(LoginResponseModel model) async {}
}
