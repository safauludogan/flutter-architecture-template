import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../features/home/view/home_view.dart';
import '../../features/splash/view/splash_view.dart';
part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashView, path: 'splashView', initial: true),
    AutoRoute(page: HomeView, path: 'homeView')
  ],
)
class AppRouter extends _$AppRouter {}
