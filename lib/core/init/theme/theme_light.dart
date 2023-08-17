import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/constants/colors.dart';

class ThemeLight {
  ThemeLight._init();
  static ThemeLight? _instance;
  static ThemeLight get instance {
    _instance ??= ThemeLight._init();
    return _instance!;
  }

  ThemeData? get theme => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: ColorConstants.backgroundColor,
        primaryColor: ColorConstants.primaryColor,
        dividerColor: Colors.grey,
        appBarTheme: _appBarTheme,
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
}
