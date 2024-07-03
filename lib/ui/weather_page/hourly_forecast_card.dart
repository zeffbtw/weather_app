import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/hourly_forecast_model.dart';
import 'package:weather_app/values.dart';

class HourlyForecastCard extends StatelessWidget {
  const HourlyForecastCard({
    super.key,
    required this.hourInfo,
  });

  final HourlyForecast hourInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding * 1.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, offset: const Offset(3, 3), blurRadius: 6),
          const BoxShadow(color: Colors.white, offset: Offset(-3, -3), blurRadius: 6),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(DateFormat.Hm().format(DateTime(0, 0, 0, hourInfo.hour)), style: const TextStyle(fontSize: 16)),
          Row(
            children: [
              SvgPicture.network(iconUrl + hourInfo.icon),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Температура: ${hourInfo.temp}°C'),
                  Text('Ощущается как: ${hourInfo.feelsTemp}°C'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
