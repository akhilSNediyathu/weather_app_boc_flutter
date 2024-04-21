part of 'weather_boc_bloc.dart';

sealed class WeatherBocState extends Equatable {
  const WeatherBocState();
  
  @override
  List<Object> get props => [];
}

final class WeatherBocInitial extends WeatherBocState {}


final class WeatherBocLoading extends WeatherBocState {}
final class WeatherBocFailure extends WeatherBocState {}
final class WeatherBocSuccess extends WeatherBocState {

final Weather weather;

 const WeatherBocSuccess({required this.weather});

  @override
  List<Object> get props => [weather];
}



