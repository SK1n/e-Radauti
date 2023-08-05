import 'package:shared_preferences/shared_preferences.dart';

class IsFirstRun {
  static const _firstRunSettingsKey = 'IS_FIRST_RUN';
  static bool? _isFirstRun;

  static Future<bool> isFirstRun() async {
    if (_isFirstRun != null) {
      return _isFirstRun!;
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstRun;
    try {
      isFirstRun = prefs.getBool(_firstRunSettingsKey) ?? true;
    } on Exception {
      isFirstRun = true;
    }
    await prefs.setBool(_firstRunSettingsKey, false);
    _isFirstRun ??= isFirstRun;
    return isFirstRun;
  }

  static Future<void> reset() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_firstRunSettingsKey, true);
  }
}
