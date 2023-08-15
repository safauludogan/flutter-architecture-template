import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/extension/context_extension.dart';

class SafeListView extends StatelessWidget {
  SafeListView(
      {super.key,
      required this.itemCount,
      required this.itemBuilder,
      required this.noDataWidget,
      this.description});
  int? itemCount;
  Widget? Function(BuildContext, int index) itemBuilder;
  Widget noDataWidget;
  String? description;
  @override
  Widget build(BuildContext context) {
    if (itemCount == null || itemCount == 0) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: context.dynamicHeight(0.2), child: noDataWidget),
          description != null
              ? const SizedBox(height: 40)
              : const SizedBox.shrink(),
          description != null
              ? Text(
                  description!,
                  style: context.textTheme.titleMedium!
                      .copyWith(color: Colors.grey),
                )
              : const SizedBox.shrink()
        ],
      ));
    }
    return FadeInUp(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
