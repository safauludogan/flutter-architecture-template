import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/constants/colors.dart';
import 'package:flutter_architecture_template/core/extension/context_extension.dart';

class CustomRefreshIndicator extends StatelessWidget {
  const CustomRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.body,
  });
  final Future<void> Function() onRefresh;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ColorConstants.primaryColor,
      onRefresh: onRefresh,
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: SizedBox(height: context.dynamicHeight(.9), child: body)),
    );
  }
}
