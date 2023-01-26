import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/constants/colors.dart';
import 'package:flutter_architecture_template/core/init/main/main_init.dart';
import 'package:provider/provider.dart';

import '../../../core/init/toast/toast_service.dart';
import '../../../product/manager/theme_manager.dart';
import '../../../product/navigator/app_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with ToastService {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<ThemeManager>().changeTheme(),
          child: Icon(Icons.change_circle, color: ColorConstants.whiteColor),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => getIt<AppRouter>().push(const HomeRoute()),
                  child: const Text('Push')),
              FilledButton(onPressed: () {}, child: Text('Aktif'))
            ],
          ),
        ));
  }
}
