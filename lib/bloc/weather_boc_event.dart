part of 'weather_boc_bloc.dart';

sealed class WeatherBocEvent extends Equatable {
  const WeatherBocEvent();

  @override
  List<Object> get props => [];
}
class FetchWeather extends WeatherBocEvent{
  final Position position;
  const FetchWeather(this.position);
  @override
  List<Object> get props => [position];

}
