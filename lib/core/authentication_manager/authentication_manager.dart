import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/constants/project_items.dart';
import 'package:flutter_architecture_template/core/init/cache/locale_manager.dart';
import 'package:flutter_architecture_template/core/init/toast/toast_service.dart';
import 'package:flutter_architecture_template/features/authentication/login/model/login_response_model.dart';
import 'package:flutter_architecture_template/main.dart';
import 'package:flutter_architecture_template/product/manager/database/operations/login_hive_operation.dart';
import 'package:flutter_architecture_template/product/navigator/app_router.dart';

class AuthenticationManager {
  Future<void> logOut() async {
    await LocaleManager.instance.clearAll();
    unawaited(getIt<AppRouter>().replace(const SplashRoute()));
  }

  Future<void> login(
    BuildContext context,
    LoginResponseModel loginResponseModel,
  ) async {
    final _loginHiveOperation = LoginHiveOperation();
    await _loginHiveOperation.open();
    await _loginHiveOperation.addOrUpdateItem(loginResponseModel);

    await LocaleManager.instance.setStringValue(
      PreferencesKeys.token,
      value: loginResponseModel.token!,
    );
    ToastService.success.show(text: ProjectItems.loginSuccess);
    unawaited(getIt<AppRouter>().replace(const HomeRoute()));
  }

  bool checkLoginStatus() {
    final token = LocaleManager.instance.getStringValue(PreferencesKeys.token);
    if (token != null) {
      return true;
    }
    return false;
  }
}
