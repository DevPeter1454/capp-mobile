import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton

class SharedPreferencesService{
  final SharedPreferences _sharedPreferences;

  static const _authToken = 'authToken';

  SharedPreferencesService(this._sharedPreferences);

  Future<bool> setAuthToken(String value) async {
    return await _sharedPreferences.setString(_authToken, value);
  }
  
  Future<bool>clear() async {
    return await _sharedPreferences.clear();
  }

  
   String? get authToken => _sharedPreferences.getString(_authToken);
}