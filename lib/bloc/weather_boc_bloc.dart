import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';

part 'weather_boc_event.dart';
part 'weather_boc_state.dart';

class WeatherBocBloc extends Bloc<WeatherBocEvent, WeatherBocState> {
  WeatherBocBloc() : super(WeatherBocInitial()) {
    on<FetchWeather>((event, emit) {
       emit(WeatherBocLoading());
      try {
        WeatherFactory wf = WeatherFactory(_apikey,language: Language.ENGLISH);
        emit(WeatherBocSuccess());
        
      } catch (e) {
        emit(WeatherBocFailure());
      }
     
    });
  }
}
