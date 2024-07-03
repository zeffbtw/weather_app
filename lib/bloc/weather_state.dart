part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();
}

final class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

final class WeatherLoading extends WeatherState {
  @override
  List<Object> get props => [];
}

final class WeatherLoaded extends WeatherState {
  final List<Forecast> forecasts;
  const WeatherLoaded(this.forecasts);
  @override
  List<Object> get props => [forecasts];
}

final class WeatherError extends WeatherState {
  @override
  List<Object> get props => [];
}
