import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/init/main/main_init.dart';
import '../../../core/authentication_manager/authentication_manager.dart';
import '../../../core/init/toast/toast_service.dart';
import '../../../product/navigator/app_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with ToastService {
  Future<void> startTimer() async {
    if (AuthenticationManager.instance.checkLoginStatus()) {
      getIt<AppRouter>().replace(const HomeRoute());
    } else {
      getIt<AppRouter>().replace(const LoginRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: startTimer(),
      builder: (context, snapshot) =>
          const Center(child: CircularProgressIndicator.adaptive()),
    ));
  }
}
