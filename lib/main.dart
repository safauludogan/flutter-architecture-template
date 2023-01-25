import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/components/view/no_network_widget.dart';
import 'package:flutter_architecture_template/core/init/lang/language_manager.dart';
import 'package:flutter_architecture_template/core/init/locale/localization_manager.dart';
import 'package:flutter_architecture_template/core/init/main/main_init.dart';
import 'package:flutter_architecture_template/product/navigator/navigation_service.dart';
import 'package:provider/provider.dart';
import 'product/manager/theme_manager.dart';
import 'product/navigator/app_router.dart';

Future<void> main() async {
  await MainInit.init();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<ThemeManager>(create: (_) => ThemeManager.instance)
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  final botToastBuilder = BotToastInit();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();
    return MaterialApp.router(
      theme: context.watch<ThemeManager>().getThemeData,
      routerDelegate: AutoRouterDelegate(router),
      routeInformationParser: router.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        child = botToastBuilder(context, child);
        return Column(
          children: [Expanded(child: child), const NoNetworkWidget()],
        );
      },
      key: GlobalKeyContext.navigatorKey,
      localizationsDelegates:
          LocalizationManager.instance.localizationsDelegates,
      supportedLocales: LanguageManager.instance.supportedLocales,
      locale: LanguageManager.instance.trLocale,
    );
  }
}
