import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/components/view/no_network_widget.dart';
import 'package:flutter_architecture_template/core/init/cache/locale_manager.dart';
import 'package:flutter_architecture_template/core/init/lang/language_manager.dart';
import 'package:flutter_architecture_template/core/init/locale/localization_manager.dart';
import 'package:flutter_architecture_template/core/init/utils/web_scroll_behavior.dart';
import 'package:flutter_architecture_template/product/manager/database/hive_database_manager.dart';
import 'package:flutter_architecture_template/product/manager/network/network_manager.dart';
import 'package:flutter_architecture_template/product/manager/theme/theme_manager.dart';
import 'package:flutter_architecture_template/product/navigator/app_router.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
part 'core/init/main/main_init.dart';

Future<void> main() async {
  await initInitializes();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeManager>(
          create: (_) => ThemeManager.instance,
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final botToastBuilder = BotToastInit();
  final router = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(),
      scrollBehavior: MyCustomScrollBehavior(),
      theme: context.watch<ThemeManager>().getThemeData,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        NetworkManager.instance.init(context);
        child = botToastBuilder(context, child);
        return Column(
          children: [Expanded(child: child), const NoNetworkWidget()],
        );
      },
      localizationsDelegates:
          LocalizationManager.instance.localizationsDelegates,
      supportedLocales: LanguageManager.instance.supportedLocales,
      locale: LanguageManager.instance.trLocale,
    );
  }
}
