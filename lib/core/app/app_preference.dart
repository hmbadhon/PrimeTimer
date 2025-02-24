import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_dependency.dart';

const String prefsKeyLang = "prefsKeyLang";
const String prefsKeyIsUserLoggedIn = "prefsKeyIsUserLoggedIn";
const String prefsKeyUserLanguage = "prefsKeyUserLanguage";
const String prefsKeyAppDarkTheme = "prefsKeyAppDarkTheme";

const String prefsKeyUserInfo = "prefsKeyUserInfo";
const String prefsKeyUserToken = "prefsKeyUserToken";

const String prefsKeyDeviceToken = "prefsKeyDeviceToken";

@injectable
class AppPreferences {
  final _sharedPreferences = instance<SharedPreferences>();

  /// set preferences data start here ///

  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  }

  // Future<void> saveUserData(UserData userData) async {
  //   _sharedPreferences.setString(prefsKeyUserInfo, json.encode(userData));
  //   setIsUserLoggedIn();
  // }

  Future<void> setUserAuthToken(String? token) async {
    _sharedPreferences.setString(prefsKeyUserToken, token ?? '');
  }

  Future<void> setFCMToken(String? token) async {
    _sharedPreferences.setString(prefsKeyDeviceToken, token ?? '');
  }

  Future<void> setLanguage(String? language) async {
    _sharedPreferences.setString(prefsKeyUserLanguage, language ?? 'de');
  }

  Future<void> setIsAppDarkTheme(bool isDark) async {
    _sharedPreferences.setBool(prefsKeyAppDarkTheme, isDark);
  }

  Future<void> removeUserData() async {
    _sharedPreferences.remove(prefsKeyUserInfo);
  }

  /// set preferences data end here ///

  /// get preferences data start here ///

  // UserData getUserData() {
  //   return UserData.fromJson(
  //       json.decode(_sharedPreferences.getString(prefsKeyUserInfo)!));
  // }

  Future<String> getUserAuthToken() async {
    return _sharedPreferences.getString(prefsKeyUserToken) ?? "";
  }

  Future<String> getDeviceToken() async {
    return _sharedPreferences.getString(prefsKeyDeviceToken) ?? "";
  }

  String getLanguage() {
    return _sharedPreferences.getString(prefsKeyUserLanguage) ?? 'English';
  }

  bool getIsAppDarkTheme() {
    return _sharedPreferences.getBool(prefsKeyAppDarkTheme) ?? true;
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(prefsKeyIsUserLoggedIn) ?? false;
  }

  Future<void> logout() async {
    await removeUserData();
    _sharedPreferences.remove(prefsKeyIsUserLoggedIn);
  }

  /// get preferences data end here ///
}
