import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/extension/context_extension.dart';
import 'package:flutter_architecture_template/core/init/main/main_init.dart';
import '../../../core/init/toast/toast_service.dart';
import '../../../product/navigator/app_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with ToastService {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  Future<void> startTimer() async {
    await Future.delayed(context.lowDuration);
    getIt<AppRouter>().replace(const HomeRoute());
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
