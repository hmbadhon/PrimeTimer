import 'dart:convert';
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:prime_timer/features/screens/home/models/prime_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_dependency.dart';

const String prefsKeyAppDarkTheme = "prefsKeyAppDarkTheme";

const String prefsKeyPrimeData = "prefsKeyPrimeData";

@injectable
class AppPreferences {
  final _sharedPreferences = instance<SharedPreferences>();

  /// set preferences data start here ///

  Future<void> savePrimeData(PrimeModel data) async {
    _sharedPreferences.setString(prefsKeyPrimeData, json.encode(data));
  }

  void setIsAppDarkTheme(bool isDark) {
    _sharedPreferences.setBool(prefsKeyAppDarkTheme, isDark);
  }

  /// set preferences data end here ///

  /// get preferences data start here ///

  PrimeModel getPrimeData() {
    String? jsonString = _sharedPreferences.getString(prefsKeyPrimeData);

    if (jsonString == null || jsonString.isEmpty) {
      return PrimeModel(data: []);
    }

    try {
      return PrimeModel.fromJson(json.decode(jsonString));
    } catch (e) {
      log("Error decoding JSON: $e");
      return PrimeModel(data: []);
    }
  }

  bool getIsAppDarkTheme() {
    return _sharedPreferences.getBool(prefsKeyAppDarkTheme) ?? true;
  }

  /// get preferences data end here ///
}
