import 'package:shared_preferences/shared_preferences.dart';

import '../values.dart';

class SettingsRepository {
  late SharedPreferences prefs;

  Future<double> getSavedLatitude() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(latKey) ?? defaultLat;
  }

  Future<double> getSavedLongitude() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(lonKey) ?? defaultLon;
  }

  Future<void> saveLatitude(double value) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setDouble(latKey, value);
  }

  Future<void> saveLongitude(double value) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setDouble(lonKey, value);
  }
}
