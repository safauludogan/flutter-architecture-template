import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/init/theme/theme_dark.dart';

import '../../core/init/theme/theme_light.dart';

enum ThemeType { light, dark }

class ThemeManager extends ChangeNotifier {
  ThemeManager._init();
  static final ThemeManager _instance = ThemeManager._init();
  static ThemeManager get instance => _instance;

  late final ThemeData _lightData = ThemeLight.instance.theme!;
  late final ThemeData _darkData = ThemeDark.instance.theme!;

  ThemeType _currentThemeType = ThemeType.light;

  ThemeData get getThemeData =>
      (_currentThemeType == ThemeType.light) ? _lightData : ThemeData.dark();

  void changeTheme() {
    switch (_currentThemeType) {
      case ThemeType.light:
        _currentThemeType = ThemeType.dark;
        break;
      case ThemeType.dark:
        _currentThemeType = ThemeType.light;
        break;
      default:
        _currentThemeType = ThemeType.light;
        break;
    }
    notifyListeners();
  }
}
