import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/constants/colors.dart';
import 'package:flutter_architecture_template/core/constants/project_items.dart';
import 'package:flutter_architecture_template/core/constants/project_variables.dart';
import 'package:flutter_architecture_template/core/constants/validators.dart';
import 'package:flutter_architecture_template/core/extension/context_extension.dart';

bool isPasswordVisible = true;

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    required this.customTextFormFieldAdapter,
    required this.controller,
    super.key,
    this.onChanged,
  });
  final ICustomTextFormFieldAdapter customTextFormFieldAdapter;
  final TextEditingController controller;
  final void Function(String value)? onChanged;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    final adapter = widget.customTextFormFieldAdapter.model;
    return TextFormField(
      cursorColor: Colors.black,
      onChanged: widget.onChanged != null
          ? (value) {
              widget.onChanged!.call(value);
            }
          : null,
      controller: widget.controller,
      validator: (value) => adapter.validator?.call(value),
      maxLength: adapter.maxLength ?? 20,
      keyboardType: adapter.keyboardType ?? TextInputType.text,
      obscureText:
          widget.customTextFormFieldAdapter is PasswordTextFormFieldAdapter
              ? isPasswordVisible
              : false,
      style: context.textTheme.titleSmall,
      decoration: InputDecoration(
        counterText: '',
        alignLabelWithHint: true,
        prefixIcon: adapter.prefixIcon,
        labelText: adapter.labelText,
        focusedBorder: OutlineInputBorder(
          borderRadius: context.borderRadiusHigh,
          borderSide: BorderSide(color: ColorConstants.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: context.borderRadiusHigh,
          borderSide: const BorderSide(color: Colors.grey),
        ),
        labelStyle: context.textTheme.titleSmall!.copyWith(color: Colors.grey),
        prefixIconColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.focused)
              ? ColorConstants.primaryColor
              : Colors.grey,
        ),
        suffixIcon: adapter.suffixIcon != null
            ? IconButton(
                onPressed: () {
                  setState(
                    () =>
                        widget.customTextFormFieldAdapter.suffixIconCallback(),
                  );
                },
                icon: adapter.suffixIcon!,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: context.borderRadiusHigh,
        ),
      ),
    );
  }
}

abstract class ICustomTextFormFieldAdapter {
  CustomTextFormFieldModel get model;
  void suffixIconCallback();
}

class EmailTextFormFieldAdapter implements ICustomTextFormFieldAdapter {
  @override
  CustomTextFormFieldModel get model => CustomTextFormFieldModel.email();

  @override
  void suffixIconCallback() {
    throw Exception('$this E-postada suffix callback yok');
  }
}

class PasswordTextFormFieldAdapter implements ICustomTextFormFieldAdapter {
  @override
  CustomTextFormFieldModel get model => CustomTextFormFieldModel.password();

  @override
  void suffixIconCallback() {
    isPasswordVisible = !isPasswordVisible;
  }
}

class SearchTextFormFieldAdapter implements ICustomTextFormFieldAdapter {
  @override
  CustomTextFormFieldModel get model => CustomTextFormFieldModel.search();

  @override
  void suffixIconCallback() {
    throw Exception('$this Search suffix callback yok');
  }
}

class CustomTextFormFieldModel {
  CustomTextFormFieldModel.email() {
    labelText = ProjectItems.enterEmail;
    prefixIcon = const Icon(Icons.person);
    keyboardType = TextInputType.emailAddress;
    validator = validateEmail;
    maxLength = ProjectVaribles.emailMaxLength;
  }
  CustomTextFormFieldModel.password() {
    labelText = ProjectItems.password;
    prefixIcon = const Icon(Icons.password);
    keyboardType = TextInputType.text;
    validator = validatePassword;
    suffixIcon = isPasswordVisible == true
        ? const Icon(Icons.visibility_off_rounded, color: Colors.grey)
        : Icon(Icons.visibility_rounded, color: ColorConstants.primaryColor);
    maxLength = ProjectVaribles.emailMaxLength;
  }
  CustomTextFormFieldModel.search() {
    labelText = ProjectItems.search;
    prefixIcon = const Icon(Icons.search);
  }
  late String labelText;
  late Widget prefixIcon;
  int? maxLength;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  String? Function(String? value)? validator;
}
