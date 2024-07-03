import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/forecast_model.dart';
import 'package:weather_app/values.dart';

class ForecastCard extends StatelessWidget {
  final Forecast forecast;
  final VoidCallback onTap;

  const ForecastCard({super.key, required this.forecast, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(kDefaultPadding),
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding, horizontal: kDefaultPadding * 1.5),
        decoration: BoxDecoration(
          color: const Color(0xFFE0E5EC),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              offset: Offset(-10, -10),
              blurRadius: 20,
            ),
            BoxShadow(
              color: Colors.black12,
              offset: Offset(10, 10),
              blurRadius: 20,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat.yMMMMd('ru').format(forecast.date),
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
            WeatherText(icon: forecast.morningIcon, time: 'Утро', temperature: forecast.morningTemp),
            Container(
              height: 1,
              color: Colors.grey[350],
            ),
            WeatherText(icon: forecast.dayIcon, time: 'День', temperature: forecast.dayTemp),
            Container(
              height: 1,
              color: Colors.grey[350],
            ),
            WeatherText(icon: forecast.eveningIcon, time: 'Вечер', temperature: forecast.eveningTemp),
            Container(
              height: 1,
              color: Colors.grey[350],
            ),
            WeatherText(icon: forecast.nightIcon, time: 'Ночь', temperature: forecast.nightTemp),
          ],
        ),
      ),
    );
  }
}

class WeatherText extends StatelessWidget {
  final String icon;
  final String time;
  final int temperature;

  const WeatherText({super.key, required this.icon, required this.time, required this.temperature});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.network(iconUrl + icon),
        const SizedBox(width: kDefaultPadding),
        Text(
          time,
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          "$temperature°C",
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
