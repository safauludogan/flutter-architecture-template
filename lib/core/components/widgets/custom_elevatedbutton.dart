import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/extension/context_extension.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {super.key, required this.text, required this.callback, this.isLoading});
  final String text;
  final VoidCallback callback;
  bool? isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading == true ? null : callback,
      child: SizedBox(
        height: kIsWeb == true
            ? context.dynamicHeight(0.98)
            : context.dynamicHeight(0.065),
        child: Center(
            child: isLoading == true
                ? const CircularProgressIndicator()
                : Text(
                    text,
                    style: context.textTheme.labelLarge!
                        .copyWith(color: Colors.white),
                  )),
      ),
    );
  }
}
