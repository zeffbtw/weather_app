import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/ui/weather_page/forecast_list.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoading) return const Text('Loading...');
              if (state is WeatherError) return const Text('Error');
              if (state is WeatherLoaded) return ForecastList(forecasts: state.forecasts);
              return const Text("Hello");
            },
          ),
        ),
      ),
    );
  }
}
