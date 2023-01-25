import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../product/navigator/app_router.dart';
import '../cache/locale_manager.dart';

final getIt = GetIt.instance;

class MainInit {
  MainInit._();
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    getIt.registerSingleton<AppRouter>(AppRouter());
    await LocaleManager.instance.init();
  }
}
