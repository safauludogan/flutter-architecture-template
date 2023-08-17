import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/init/cache/locale_manager.dart';
import 'package:flutter_architecture_template/core/init/theme/theme_dark.dart';

import 'package:flutter_architecture_template/core/init/theme/theme_light.dart';

enum ThemeType { light, dark }

class ThemeManager extends ChangeNotifier {
  ThemeManager._init();
  static final ThemeManager _instance = ThemeManager._init();
  static ThemeManager get instance => _instance;

  late final ThemeData _lightData = ThemeLight.instance.theme!;
  late final ThemeData _darkData = ThemeDark.instance.theme!;

  ThemeType _currentThemeType = ThemeType.light;

  ThemeData get getThemeData {
    final result = LocaleManager.instance.getStringValue(PreferencesKeys.theme);
    if (result == null) return _lightData;
    _currentThemeType =
        ThemeType.values.firstWhere((element) => element.toString() == result);
    return (_currentThemeType == ThemeType.light) ? _lightData : _darkData;
  }

  void changeTheme() {
    switch (_currentThemeType) {
      case ThemeType.light:
        _currentThemeType = ThemeType.dark;
        break;
      case ThemeType.dark:
        _currentThemeType = ThemeType.light;
        break;
    } 
    LocaleManager.instance.setStringValue(PreferencesKeys.theme,
        value: _currentThemeType.toString(),);
    notifyListeners();
  }
}
