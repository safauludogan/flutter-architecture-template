import 'package:flutter/material.dart';

class ColorConstants {
  ColorConstants._();
  static ColorConstants get instance {
    _instance ??= ColorConstants._();
    return _instance!;
  }

  static ColorConstants? _instance;

  static Color primaryColor900 = const Color(0xff001f63);
  static Color primaryColor800 = const Color(0xff002f76);
  static Color primaryColor700 = const Color(0xff003881);
  static Color primaryColor600 = const Color(0xff10428c);
  static Color primaryColor500 = const Color(0xFF184995);
  static Color primaryColor400 = const Color(0xff4762a0);
  static Color primaryColor300 = primaryColor;
  static Color primaryColor200 = const Color(0xff92a1c6);
  static Color primaryColor100 = const Color(0xffbdc6dd);
  static Color primaryColor50 = const Color(0xffe5e8f1);

  static Color primaryColor = const Color(0xff687daf);
  static Color textColor = const Color(0xFF3B3B3B);

  static const Color googleRedColor = Color(0xffDB4437);
  static const Color facebookBlueColor = Color(0xff4267B2);
  static const Color appleBlackColor = Color(0xff000000);
  static const Color backgroundColor = Color(0xFFEEEDF2);

  static Color greyColor = const Color(0xff808080);
  static Color lightGreyColor = const Color(0xffE2E2E2);
  static Color softGreyColor = const Color(0xffCCCCCC);
  static Color semiGreyColor = const Color(0xff9D9D9D);
  static Color lightBlackColor = const Color(0xff5F5F5F);
  static Color bottomNavSelectedItemColor = Colors.blueGrey;
  static Color bottomNavUnselectedItemColor = const Color(0xff526480);

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

  //izin status color
  static Color deniedColor = const Color(0xffE33147);
  static Color deniedLightColor = const Color.fromARGB(255, 250, 243, 242);
  static Color acceptColor = const Color(0xff2AA748);
  static Color acceptLightColor = const Color.fromARGB(255, 244, 252, 246);
  static Color waitingColor = const Color(0xffE2C34E);
  static Color waitingLightColor = const Color.fromARGB(255, 248, 247, 239);
}
