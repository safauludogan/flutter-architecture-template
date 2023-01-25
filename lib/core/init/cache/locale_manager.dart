import 'package:shared_preferences/shared_preferences.dart';

class LocaleManager {
  static final LocaleManager _instance = LocaleManager._init();
  static LocaleManager get instance => _instance;
  LocaleManager._init();
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  SharedPreferences? _preferences;

  Future<void> clearAll() async {
    _preferences ??= await SharedPreferences.getInstance();
    await _preferences!.clear();
  }

  Future<void> setStringValue(PreferencesKeys preferencesKeys,
      {required String value}) async {
    _preferences ??= await SharedPreferences.getInstance();
    _preferences!.setString(preferencesKeys.toString(), value);
  }

  Future<void> setBoolValue(PreferencesKeys preferencesKeys,
      {required bool value}) async {
    _preferences ??= await SharedPreferences.getInstance();
    _preferences?.setBool(preferencesKeys.toString(), value);
  }

  String? getStringValue(PreferencesKeys preferencesKeys) =>
      _preferences?.getString(preferencesKeys.toString());

  bool? getBoolValue(PreferencesKeys preferencesKeys) =>
      _preferences?.getBool(preferencesKeys.toString());
}

enum PreferencesKeys { theme }
