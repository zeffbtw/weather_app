import 'package:weather_app/models/model.dart';

class HourlyForecast extends Model {
  late int hour;
  late int temp;
  late int feelsTemp;
  late String icon;
  HourlyForecast.fromJson(Map<String, dynamic> json) {
    hour = intFromJson(json, 'hour');
    temp = intFromJson(json, 'temp');
    feelsTemp = intFromJson(json, 'feels_like');
    icon = "${stringFromJson(json, 'icon')}.svg";
  }
}
