import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/forecast_model.dart';
import 'package:weather_app/ui/weather_page/hourly_forecast_card.dart';

class HourlyForecastPage extends StatelessWidget {
  const HourlyForecastPage({super.key, required this.forecast});
  final Forecast forecast;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat.MMMMd('ru').format(forecast.date)),
        surfaceTintColor: Colors.grey.shade400,
      ),
      body: ListView.builder(
        itemCount: forecast.hourlyForecasts.length,
        itemBuilder: (context, index) {
          final hourInfo = forecast.hourlyForecasts[index];
          return HourlyForecastCard(hourInfo: hourInfo);
        },
      ),
    );
  }
}
