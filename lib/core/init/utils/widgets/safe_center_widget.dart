import 'package:flutter/material.dart';

class SafeCenter extends StatelessWidget {
  SafeCenter({
    super.key,
    required this.isCenter,
    required this.child,
  });
  bool isCenter;
  Widget child;
  @override
  Widget build(BuildContext context) {
    if (isCenter) {
      return Center(child: child);
    }
    return child;
  }
}
