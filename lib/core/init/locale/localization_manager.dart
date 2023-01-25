import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LocalizationManager {
  LocalizationManager._();
  static LocalizationManager? _instance;
  static LocalizationManager get instance {
    _instance ??= LocalizationManager._();
    return _instance!;
  }

  Iterable<LocalizationsDelegate<dynamic>> get localizationsDelegates => const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];
}
