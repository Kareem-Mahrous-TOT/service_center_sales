import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefs {
  Future<bool?> saveString({required String key, required String value});
  String? getString({required String key});
  Future<bool> remove({required String key});
}

class SharedPrefsImpl implements SharedPrefs {
  final SharedPreferences _sharedPreferences;

  SharedPrefsImpl({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  @override
  Future<bool> saveString({required String key, required String value}) async {
    return await _sharedPreferences.setString(key, value);
  }

  @override
  String? getString({required String key}) {
    try {
      final result = _sharedPreferences.getString(key);
      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> remove({required String key}) async {
    return await _sharedPreferences.remove(key);
  }
}
