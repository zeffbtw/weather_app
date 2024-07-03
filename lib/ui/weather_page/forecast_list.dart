import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/ui/weather_page/forecast_card.dart';
import 'package:weather_app/ui/weather_page/hourly_forecast_page.dart';

import '../../models/forecast_model.dart';

class ForecastList extends StatelessWidget {
  const ForecastList({super.key, required this.forecasts});

  final List<Forecast> forecasts;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<WeatherBloc>().add(WeatherLoadData());
      },
      child: ListView.builder(
        clipBehavior: Clip.none,
        itemCount: forecasts.length,
        itemBuilder: (context, index) => ForecastCard(
          forecast: forecasts[index],
          onTap: () => PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: HourlyForecastPage(forecast: forecasts[index]),
            withNavBar: false,
          ),
        ),
      ),
    );
  }
}
