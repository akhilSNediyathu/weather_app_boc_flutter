import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/data/my_data.dart';

part 'weather_boc_event.dart';
part 'weather_boc_state.dart';

class WeatherBocBloc extends Bloc<WeatherBocEvent, WeatherBocState> {
  WeatherBocBloc() : super(WeatherBocInitial()) {
    on<FetchWeather>((event, emit) async {
       emit(WeatherBocLoading());
      try {
        WeatherFactory wf = WeatherFactory(apikey,language: Language.ENGLISH);
     
        Weather weather = await wf.currentWeatherByLocation(
        event.  position.latitude,
       event.   position.longitude
          );
          print(weather); 
        emit(WeatherBocSuccess(weather: weather));
        
      } catch (e) {
        emit(WeatherBocFailure());
      }
     
    });
  }
}
