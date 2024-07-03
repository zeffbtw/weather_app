import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/values.dart';

import '../models/forecast_model.dart';

class WeatherRepository {
  WeatherService weatherService = WeatherService();
  late SharedPreferences prefs;

  Future<List<Forecast>> getForecasts() async {
    prefs = await SharedPreferences.getInstance();
    double lat = prefs.getDouble(latKey) ?? defaultLat;
    double lon = prefs.getDouble(lonKey) ?? defaultLon;
    final response = await weatherService.getForecasts(lat, lon);
    return List.generate(response.length, (index) => Forecast.fromJson(response[index]));
  }
}
