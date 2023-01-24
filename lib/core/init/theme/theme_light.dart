import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/init/constants/elevation_constants.dart';
import 'package:flutter_architecture_template/core/init/theme/utils/font_sizes.dart';

import '../constants/colors.dart';

class ThemeLight {
  static ThemeLight? _instance;
  static ThemeLight get instance {
    _instance ??= ThemeLight._init();
    return _instance!;
  }

  ThemeLight._init();

  final _fontFamily = 'Montserrat';

  ThemeData? get theme => ThemeData(
      scaffoldBackgroundColor: ColorConstants.scaffoldBackgroundColor,
      primaryColor: ColorConstants.primaryColor,
      appBarTheme: _appBarTheme,
      textTheme: _textTheme,
      colorScheme: _colorScheme.copyWith(
          background: ColorConstants.scaffoldBackgroundColor));

  TextTheme get _textTheme => TextTheme(
        headline1: _textStyle(fontSize: FontSizes.extraBig.value),
        headline2: _textStyle(fontSize: FontSizes.veryBig.value),
        headline3: _textStyle(fontSize: FontSizes.big.value),
        headline4: _textStyle(fontSize: FontSizes.semiBig.value),
        headline5: _textStyle(fontSize: FontSizes.normal.value),
        headline6: _textStyle(fontSize: FontSizes.semiNormal.value),
        subtitle1: _textStyle(fontSize: FontSizes.semiNormal.value),
        subtitle2: _textStyle(fontSize: FontSizes.normal.value),
        bodyText1: _textStyle(fontSize: FontSizes.small.value),
        bodyText2: _textStyle(fontSize: FontSizes.semiBig.value),
        button: _textStyle(fontSize: FontSizes.semiBig.value),
        caption: _textStyle(fontSize: FontSizes.semiBig.value),
        overline: _textStyle(fontSize: FontSizes.semiBig.value),
      );

  ColorScheme get _colorScheme => ColorScheme.fromSwatch(
      primarySwatch: MaterialColor(ColorConstants.primaryColorList[400]!.value,
          ColorConstants.primaryColorList));

  AppBarTheme get _appBarTheme => AppBarTheme(
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      elevation: ElevationConstants.lowElevation,
      centerTitle: true,
      iconTheme: IconThemeData(color: ColorConstants.whiteColor),
      titleTextStyle: _textStyle(
          fontSize: FontSizes.semiBig.value, fontWeight: FontWeight.w400));

  TextStyle _textStyle({required double fontSize, FontWeight? fontWeight}) {
    return TextStyle(
        color: ColorConstants.blackColor,
        fontFamily: _fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontStyle: FontStyle.normal);
  }
}
