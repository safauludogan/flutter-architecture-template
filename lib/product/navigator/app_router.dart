import 'package:auto_route/auto_route.dart';
import 'package:flutter_architecture_template/features/authentication/login/view/login_view.dart';
import 'package:flutter_architecture_template/features/home/base/view/home_view.dart';
import 'package:flutter_architecture_template/features/splash/view/splash_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: '/'),
        AutoRoute(page: HomeRoute.page, path: '/homeView'),
        AutoRoute(page: LoginRoute.page, path: '/loginView'),
      ];
}
