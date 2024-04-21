// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:weather_app/bloc/weather_boc_bloc.dart';
// import 'package:weather_app/constrains/colors.dart';
// import 'package:weather_app/view/home/screen_home.dart';

// class ScreenSplash extends StatefulWidget {
//     const ScreenSplash({super.key});

//     @override
//     _ScreenSplashState createState() => _ScreenSplashState();
// }

// class _ScreenSplashState extends State<ScreenSplash> {
//     @override
//     void initState() {
//         super.initState();
//     }

//     @override
//     Widget build(BuildContext context) {
//         return Scaffold(
//             backgroundColor: kgreyColor,
//             body: FutureBuilder<Position>(
//                 future: Future.delayed(Duration(seconds: 3), _determinePosition),
//                 builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                         // Show a circular progress indicator while waiting for the future to complete
//                         return const Center(
//                             child: CircularProgressIndicator(),
//                         );
//                     } else if (snapshot.hasError) {
//                         // Handle error case
//                         return Center(
//                             child: Text(
//                                 'Error: ${snapshot.error}',
//                                 style: const TextStyle(color: Colors.red),
//                             ),
//                         );
//                     } else if (snapshot.hasData) {
//                         // Once data is available, navigate to the main screen
//                         final position = snapshot.data!;
//                         return BlocProvider<WeatherBocBloc>(
//                             create: (context) => WeatherBocBloc()..add(FetchWeather(position)),
//                             child: const ScreenHome(),
//                         );
//                     } else {
//                         // Return an empty widget if none of the above conditions match
//                         return const SizedBox();
//                     }
//                 },
//             ),
//         );
//     }

//     // Function to determine the user's position
//     Future<Position> _determinePosition() async {
//         bool serviceEnabled;
//         LocationPermission permission;

//         serviceEnabled = await Geolocator.isLocationServiceEnabled();
//         if (!serviceEnabled) {
//             return Future.error('Location services are disabled.');
//         }

//         permission = await Geolocator.checkPermission();
//         if (permission == LocationPermission.denied) {
//             permission = await Geolocator.requestPermission();
//             if (permission == LocationPermission.denied) {
//                 return Future.error('Location permissions are denied');
//             }
//         }

//         if (permission == LocationPermission.deniedForever) {
//             return Future.error('Location permissions are permanently denied, we cannot request permissions.');
//         }

//         return await Geolocator.getCurrentPosition();
//     }
// }
