import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/settings_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:weather_app/values.dart';

import 'ui/home/home_page.dart';

Future<void> main() async {
  await initializeDateFormatting('ru', null);

  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: Lato),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => WeatherBloc()..add(WeatherLoadData())),
          BlocProvider(create: (context) => SettingsBloc()..add(SettingsLoadData())),
        ],
        child: HomePage(),
      ),
    ),
  );
}
