import 'package:weather_app/models/hourly_forecast_model.dart';
import 'package:weather_app/models/model.dart';

class Forecast extends Model {
  late DateTime date;
  late int dayTemp;
  late String dayIcon;
  late int eveningTemp;
  late String eveningIcon;
  late int morningTemp;
  late String morningIcon;
  late int nightTemp;
  late String nightIcon;
  List<HourlyForecast> hourlyForecasts = [];
  Forecast.fromJson(Map<String, dynamic> json) {
    date = dateFromJson(json, 'date');
    dayTemp = intFromJson(json['parts']['day'], 'temp_avg');
    dayIcon = "${stringFromJson(json['parts']['day'], 'icon')}.svg";
    eveningTemp = intFromJson(json['parts']['evening'], 'temp_avg');
    eveningIcon = "${stringFromJson(json['parts']['evening'], 'icon')}.svg";
    morningTemp = intFromJson(json['parts']['morning'], 'temp_avg');
    morningIcon = "${stringFromJson(json['parts']['morning'], 'icon')}.svg";
    nightTemp = intFromJson(json['parts']['night'], 'temp_avg');
    nightIcon = "${stringFromJson(json['parts']['night'], 'icon')}.svg";
    hourlyForecasts = listFromJson(json, 'hours', (p0) => HourlyForecast.fromJson(p0));
  }
}
