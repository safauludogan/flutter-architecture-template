import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/constants/colors.dart';

class Styles {
  Styles._();
  static TextStyle textStyle = TextStyle(
    fontSize: 16,
    color: ColorConstants.textColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle headLineStyle1 = TextStyle(
    fontSize: 26,
    color: ColorConstants.textColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headLineStyle2 = TextStyle(
    fontSize: 21,
    color: ColorConstants.textColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headLineStyle3 = TextStyle(
    fontSize: 17,
    color: Colors.grey.shade500,
    fontWeight: FontWeight.w500,
  );
  static TextStyle headLineStyle4 = TextStyle(
    fontSize: 17,
    color: Colors.grey.shade500,
    fontWeight: FontWeight.w500,
  );
  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: ColorConstants.primaryColor,
    textStyle: const TextStyle(
        color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
    padding: const EdgeInsets.symmetric(horizontal: 16),
  );
}
