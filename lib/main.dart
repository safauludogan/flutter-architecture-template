import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/components/view/no_network_widget.dart';
import 'package:flutter_architecture_template/core/init/cache/locale_manager.dart';
import 'package:flutter_architecture_template/product/navigator/navigation_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'product/manager/theme_manager.dart';
import 'product/navigator/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.instance.init();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<ThemeManager>(create: (_) => ThemeManager.instance)
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  final botToastBuilder = BotToastInit();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: context.watch<ThemeManager>().getThemeData,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      builder: (context, child) {
        child = botToastBuilder(context, child);
        return Column(
          children: [Expanded(child: child), const NoNetworkWidget()],
        );
      },
      key: GlobalKeyContext.navigatorKey,
      supportedLocales: const [Locale('tr')],
      locale: const Locale('tr'),
    );
  }
}
