part of '../../../main.dart';

final getIt = GetIt.instance;

Future<void> initInitializes() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDatabaseManager().initialize();
  getIt.registerSingleton<AppRouter>(AppRouter());
  await LocaleManager.instance.init();
}
