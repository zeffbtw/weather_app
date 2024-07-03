import 'package:dio/dio.dart';
import 'package:weather_app/api_keys.dart';
import 'package:weather_app/values.dart';

class WeatherService {
  final dio = Dio();
  WeatherService() {
    dio.options
      ..connectTimeout = const Duration(seconds: 20)
      ..receiveTimeout = const Duration(seconds: 20)
      ..baseUrl = weatherBaseUrl
      ..headers = {"X-Yandex-Weather-Key": weather_api_key};
  }

  Future<List> getForecasts(double lat, double lon) async {
    var response = await dio.get(
      "/forecast",
      queryParameters: {
        "lat": lat,
        "lon": lon,
        "limit": 4,
        "hours": true,
        "extra": false,
      },
    );
    return response.data['forecasts'] as List;
  }
}
