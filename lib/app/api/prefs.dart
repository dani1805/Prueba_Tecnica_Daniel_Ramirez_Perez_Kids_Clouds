// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

enum EnumPrefs { TOKEN }

abstract class PrefsImpl {
  Future<String> getStringValue(EnumPrefs key);
  Future<bool> setStringValue(EnumPrefs key, String value);

  Future<bool> getBoolValue(EnumPrefs key);
  Future<bool> setBoolValue(EnumPrefs key, bool value);

  Future<int> getIntValue(EnumPrefs key);
  Future<bool> setIntValue(EnumPrefs key, int value);

  Future<double> getDoubleValue(EnumPrefs key);
  Future<bool> setDoubleValue(EnumPrefs key, double value);
}

class Prefs implements PrefsImpl {
  @override
  Future<bool> getBoolValue(EnumPrefs key) async {
    return (await _prefs).getBool(key.toString()) ?? false;
  }

  @override
  Future<double> getDoubleValue(EnumPrefs key) async {
    return (await _prefs).getDouble(key.toString()) ?? 0;
  }

  @override
  Future<int> getIntValue(EnumPrefs key) async {
    return (await _prefs).getInt(key.toString()) ?? 0;
  }

  @override
  Future<String> getStringValue(EnumPrefs key) async {
    return (await _prefs).getString(key.toString()) ?? '';
  }

  @override
  Future<bool> setBoolValue(EnumPrefs key, bool value) async {
    return (await _prefs).setBool(key.toString(), value);
  }

  @override
  Future<bool> setDoubleValue(EnumPrefs key, double value) async {
    return (await _prefs).setDouble(key.toString(), value);
  }

  @override
  Future<bool> setIntValue(EnumPrefs key, int value) async {
    return (await _prefs).setInt(key.toString(), value);
  }

  @override
  Future<bool> setStringValue(EnumPrefs key, String value) async {
    return (await _prefs).setString(key.toString(), value);
  }
}

Future<SharedPreferences> get _prefs async => SharedPreferences.getInstance();
