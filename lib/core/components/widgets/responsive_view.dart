import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/extension/context_extension.dart';

class ResponsiveView extends StatelessWidget {
  ResponsiveView({super.key, required this.mobile, required this.web});
  final Widget mobile;
  final Widget web;

  static bool isSmallMuchScreen(BuildContext context) {
    return context.width < 450;
  }

  static bool isSmallScreen(BuildContext context) {
    return context.width < 800;
  }

  static bool isLargeScreen(BuildContext context) {
    return context.width > 1200;
  }

  static bool isMediumScreen(BuildContext context) {
    return context.width >= 800 && context.width <= 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (kIsWeb) {
          return web;
        }
        return mobile;
      },
    );
  }
}
