import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/data/api_keys.dart';

part 'weather_boc_event.dart';
part 'weather_boc_state.dart';

class WeatherBocBloc extends Bloc<WeatherBocEvent, WeatherBocState> {
  WeatherBocBloc() : super(WeatherBocInitial()) {
    on<FetchWeather>((event, emit) async {
       emit(WeatherBocLoading());
      try {
        WeatherFactory wf = WeatherFactory(apikey,language: Language.ENGLISH);
     Position position =   await Geolocator.getCurrentPosition();
        Weather weather = await wf.currentWeatherByLocation(
          position.latitude,
          position.longitude
          );
        emit(WeatherBocSuccess(weather: weather));
        
      } catch (e) {
        emit(WeatherBocFailure());
      }
     
    });
  }
}
