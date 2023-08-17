import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/constants/colors.dart';

class ThemeDark {
  ThemeDark._init();
  static ThemeDark? _instance;
  static ThemeDark get instance {
    _instance ??= ThemeDark._init();
    return _instance!;
  }

  ThemeData? get theme => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: ColorConstants.primaryColor,
        dividerColor: Colors.grey,
        appBarTheme: _appBarTheme,
        elevatedButtonTheme: _elevatedButtonStyle,
        colorScheme: _colorScheme.copyWith(
          background: ColorConstants.backgroundColor,
        ),
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
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorConstants.primaryColor),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
      );

  ElevatedButtonThemeData get _elevatedButtonStyle => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: ColorConstants.primaryColor,
        ),
      );
}
