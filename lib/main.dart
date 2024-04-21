import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/bloc/weather_boc_bloc.dart';
import 'package:weather_app/view/home/screen_home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
     
      home:
      // ScreenSplash()
      FutureBuilder(future: _determinePosition(), 
      builder: (context,snap){
        if(snap.hasData){
          return BlocProvider<WeatherBocBloc>(
        create: (context) =>WeatherBocBloc()..add(FetchWeather(snap.data as Position)),
        child:const ScreenHome(),
      );
      
        }else{
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      }
      
      )
    );
  }





Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

 
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {

    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {

      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  
  return await Geolocator.getCurrentPosition();
}



}

