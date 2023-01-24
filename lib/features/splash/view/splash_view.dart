import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/constants/colors.dart';
import 'package:provider/provider.dart';

import '../../../product/manager/theme_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<ThemeManager>().changeTheme(),
          child: Icon(Icons.change_circle, color: ColorConstants.whiteColor),
        ),
        body: Container());
  }
}
