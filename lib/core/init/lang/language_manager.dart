import 'package:flutter/material.dart';

class LanguageManager {
  LanguageManager._();
  static LanguageManager? _instance;
  static LanguageManager get instance {
    _instance ??= LanguageManager._();
    return _instance!;
  }

  final enLocale = const Locale('en', 'US');
  final trLocale = const Locale('tr', 'TR');

  List<Locale> get supportedLocales => [enLocale, trLocale];
}
