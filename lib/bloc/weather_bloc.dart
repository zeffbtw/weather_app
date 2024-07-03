import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/forecast_model.dart';
import 'package:weather_app/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepository weatherRepository = WeatherRepository();
  List<Forecast> forecasts = [];

  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherLoadData>((event, emit) async {
      emit(WeatherLoading());
      try {
        forecasts = await weatherRepository.getForecasts();
        emit(WeatherLoaded(forecasts));
      } catch (e) {
        emit(WeatherError());
      }
    });
  }
}
