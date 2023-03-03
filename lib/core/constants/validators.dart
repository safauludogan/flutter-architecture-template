
import 'package:flutter_architecture_template/core/constants/project_items.dart';

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return ProjectItems.wrongEmail;
  }
  if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value)) {
    return ProjectItems.wrongEmail;
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return ProjectItems.passwordIsEmpty;
  }

  return null;
}
