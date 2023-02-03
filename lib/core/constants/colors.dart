import 'package:flutter/material.dart';

class ColorConstants {
  static ColorConstants? _instance;
  static ColorConstants get instance {
    _instance ??= ColorConstants._();
    return _instance!;
  }

  ColorConstants._();

  static Color primaryColor900 = const Color(0xff24548c);
  static Color primaryColor800 = const Color(0xff2d73af);
  static Color primaryColor700 = const Color(0xff3184c3);
  static Color primaryColor600 = const Color(0xff3797d7);
  static Color primaryColor500 = primaryColor;
  static Color primaryColor400 = const Color(0xff47b2ea);
  static Color primaryColor300 = const Color(0xff5fbfee);
  static Color primaryColor200 = const Color(0xff88d1f4);
  static Color primaryColor100 = const Color(0xffb6e3f8);
  static Color primaryColor50 = const Color(0xffe2f4fd);

  static Color primaryColor = const Color(0xFF3ba4e6);
  static Color scaffoldBackgroundColor =
      const Color.fromARGB(255, 245, 245, 245);
  static const Color googleRedColor = Color(0xffDB4437);
  static const Color facebookBlueColor = Color(0xff4267B2);
  static const Color appleBlackColor = Color(0xff000000);

  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
  static Color redColor = Colors.red;

  static final Map<int, Color> primaryColorList = {
    50: ColorConstants.primaryColor50,
    100: ColorConstants.primaryColor100,
    200: ColorConstants.primaryColor200,
    300: ColorConstants.primaryColor300,
    400: ColorConstants.primaryColor400,
    500: ColorConstants.primaryColor500,
    600: ColorConstants.primaryColor600,
    700: ColorConstants.primaryColor700,
    800: ColorConstants.primaryColor800,
    900: ColorConstants.primaryColor900,
  };

  //ToastColor
  static Color toastSuccessGreenColor = const Color(0xffc5f7dd);
  static Color toastSuccessGreenLeftBorderColor = const Color(0xff3bc279);
  static Color toastErrorRedColor = const Color(0xffffd0cb);
  static Color toastErrorRedLeftBorderColor = const Color(0xffe9594c);
  static Color toastInfoBlueColor = const Color(0xffcce3ff);
  static Color toastInfoBlueLeftBorderColor = const Color(0xff3e86e7);
  static Color toastWarningOrangeColor = const Color(0xffffe8c3);
  static Color toastWarningOrangeLeftBorderColor = const Color(0xffe8a029);
}
