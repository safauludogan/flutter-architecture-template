import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/init/theme/utils/font_sizes.dart';
import 'package:flutter_architecture_template/product/navigator/navigation_service.dart';

import '../../constants/colors.dart';
import '../../extension/context_extension.dart';

class ThemeDark {
  ThemeDark._init();
  static ThemeDark? _instance;
  static ThemeDark get instance {
    _instance ??= ThemeDark._init();
    return _instance!;
  }

  final _fontFamily = 'Montserrat';

  ThemeData? get theme => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: ColorConstants.primaryColor,
        dividerColor: Colors.grey,
        appBarTheme: _appBarTheme,
        textTheme: _textTheme,
        elevatedButtonTheme: _elevatedButtonStyle,
        colorScheme: _colorScheme.copyWith(
          background: ColorConstants.backgroundColor,
        ),
      );

  ElevatedButtonThemeData get _elevatedButtonStyle => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: ColorConstants.primaryColor,
          textStyle: _textTheme.titleMedium));

  TextTheme get _textTheme => TextTheme(
        displayLarge: _textStyle(fontSize: FontSizes.extraBig.value),
        displayMedium: _textStyle(fontSize: FontSizes.veryBig.value),
        displaySmall: _textStyle(fontSize: FontSizes.big.value),
        headlineMedium: _textStyle(fontSize: FontSizes.semiBig.value),
        headlineSmall: _textStyle(fontSize: FontSizes.normal.value),
        titleLarge: _textStyle(fontSize: FontSizes.semiBig.value),
        titleMedium: _textStyle(fontSize: FontSizes.semiNormal.value),
        titleSmall: _textStyle(fontSize: FontSizes.normal.value),
        bodyLarge: _textStyle(fontSize: FontSizes.big.value),
        bodyMedium: _textStyle(fontSize: FontSizes.semiBig.value),
        bodySmall: _textStyle(fontSize: FontSizes.small.value),
        labelLarge: _textStyle(fontSize: FontSizes.semiNormal.value),
        labelMedium: _textStyle(fontSize: FontSizes.small.value),
        labelSmall: _textStyle(fontSize: FontSizes.extraSmall.value),
      );

  ColorScheme get _colorScheme => ColorScheme.fromSwatch(
        cardColor: Colors.white,
        primarySwatch: MaterialColor(
          ColorConstants.primaryColorList[50]!.value,
          ColorConstants.primaryColorList,
        ),
      );

  AppBarTheme get _appBarTheme => AppBarTheme(
      backgroundColor: ColorConstants.backgroundColor,
      elevation:
          GlobalKeyContext.navigatorKey.currentContext?.normalElevation ?? 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: ColorConstants.primaryColor),
      titleTextStyle: _textStyle(
          fontSize: FontSizes.semiBig.value, fontWeight: FontWeight.w400));

  TextStyle _textStyle({required double fontSize, FontWeight? fontWeight}) {
    return TextStyle(
        color: ColorConstants.textColor,
        fontFamily: _fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontStyle: FontStyle.normal);
  }
}
