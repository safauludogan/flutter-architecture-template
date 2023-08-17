import 'package:flutter/material.dart';

class SafeCenter extends StatelessWidget {
  const SafeCenter({
    required this.isCenter,
    required this.child,
    super.key,
  });
  final bool isCenter;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if (isCenter) {
      return Center(child: child);
    }
    return child;
  }
}
