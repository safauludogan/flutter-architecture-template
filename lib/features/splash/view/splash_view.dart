import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/authentication_manager/authentication_manager.dart';
import 'package:flutter_architecture_template/main.dart';
import 'package:flutter_architecture_template/product/navigator/app_router.dart';


@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> startTimer() async {
    if (AuthenticationManager().checkLoginStatus()) {
      unawaited(getIt<AppRouter>().replace(const HomeRoute()));
    } else {
      unawaited(getIt<AppRouter>().replace(const LoginRoute()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: startTimer(),
      builder: (context, snapshot) =>
          const Center(child: CircularProgressIndicator.adaptive()),
    ),);
  }
}
