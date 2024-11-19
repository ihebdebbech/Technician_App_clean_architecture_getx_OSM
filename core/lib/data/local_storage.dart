import 'package:core/app_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late Future<SharedPreferences> _prefsFuture;

  LocalStorage(AppConfig appConfig) {
    _prefsFuture = _init();
  }

  Future<SharedPreferences> _init() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) async {
    final prefs = await _prefsFuture;
    await prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await _prefsFuture;
    return prefs.getString(key);
  }

  Future<bool> remove(String key) async {
    final prefs = await _prefsFuture;
    return prefs.remove(key);
  }

  Future<bool> clear() async {
    final prefs = await _prefsFuture;
    return prefs.clear();
  }

  Future<bool> containsKey(String key) async {
    final prefs = await _prefsFuture;
    return prefs.containsKey(key);
  }
}
