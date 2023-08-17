import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/components/widgets/social/social_adapter.dart';
import 'package:flutter_architecture_template/core/extension/context_extension.dart';
import 'package:flutter_architecture_template/product/logger/global_exception.dart';

class SocialButton extends StatelessWidget {
  const SocialButton(
      {required this.socialAdapter, required this.onComplate, super.key,});
  final ISocialAdapter socialAdapter;
  final void Function(String result) onComplate;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () async {
          final response =
              await GlobalException.make(socialAdapter.make.call);
          if (response == null) {
            //do-something
          } else {
            onComplate.call(response);
          }
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: socialAdapter.model.color,),
        icon: Icon(socialAdapter.model.icon, color: Colors.white),
        label: Text(
          socialAdapter.model.title,
          style: context.textTheme.labelSmall!.copyWith(color: Colors.white),
        ),);
  }
}
