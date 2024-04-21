import 'dart:ui';

import 'package:flutter/material.dart';


import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_boc_bloc.dart';

import 'package:weather_app/constrains/colors.dart';
import 'package:weather_app/constrains/image_selector.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kblackColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark
        ),
      ),
      body: Padding(padding: 
      const EdgeInsets.fromLTRB(40, 1.2*kToolbarHeight, 40, 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(3, -0.3),
              child: Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kpurpleColor,

                ),
              ),
            ),
             Align(
              alignment: const AlignmentDirectional(-3, -0.3),
              child: Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kpurpleColor,
                  
                ),
              ),
            ),
             Align(
              alignment: const AlignmentDirectional(0, -1.2),
              child: Container(
                height: 300,
                width: 600,
                decoration: const BoxDecoration(
                  
                  color: kambercent,
                  
                ),
              ),
            ),
            BackdropFilter(filter: ImageFilter.blur(sigmaX: 100.0,sigmaY: 100.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.transparent
              ),
            ),
            ),
            BlocBuilder<WeatherBocBloc, WeatherBocState>(
              builder: (context, state) {
                if(state is WeatherBocSuccess){
                return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text('${state.weather.areaName}',
                              style:const TextStyle(
                                color: kwhiteColor,
                                fontWeight: FontWeight.w300
                              ),
                              ),
                              kheight8,
                            const   Text('Good Morning',
                              style: TextStyle(
                                color: kwhiteColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                              // Image.asset('assets/1.png'),
                               getWeatherIcon(state.weather.weatherConditionCode!),
                               Center(
                                  child: Text('${state.weather.temperature!.celsius!.round()}°C',
                                  style:const TextStyle(
                                    color: kwhiteColor,
                                    fontSize: 55,
                                    fontWeight: FontWeight.w600
                                  ),
                                  ),
                              ),
                                Center(
                                  child: Text(state.weather.weatherMain!,
                                  style:const TextStyle(
                                    color: kwhiteColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500
                                  ),
                                  ),
                              ),
                              kheight5,
                                Center(
                                  child: Text(DateFormat('EEEE dd °').add_jm().format(state.weather.date!),
                                  style:const TextStyle(
                                    color: kwhiteColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300
                                  ),
                                  ),
                              ),
                              kheight30,
                             Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset('assets/11.png',scale: 8,),
                                      kwidth5,
                                       Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('Sunrise',
                                          
                                          style: TextStyle(
                                            color: kwhiteColor,
                                            fontWeight: FontWeight.w300
                                          ),
                                          ),
                                          kheight3,
                                          Text(DateFormat().add_jm().format(state.weather.sunrise!),
                                          
                                          style: const TextStyle(
                                            color: kwhiteColor,
                                            fontWeight: FontWeight.w700
                                          ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset('assets/12.png',scale: 8,),
                                      kwidth5,
                                       Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('Sunset',
                                          
                                          style: TextStyle(
                                            color: kwhiteColor,
                                            fontWeight: FontWeight.w300
                                          ),
                                          ),
                                          kheight3,
                                         Text(DateFormat().add_jm().format(state.weather.sunset!),
                                          
                                          style: const TextStyle(
                                            color: kwhiteColor,
                                            fontWeight: FontWeight.w700
                                          ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const Padding(padding: EdgeInsets.symmetric(vertical: 5),
                              child: Divider(
                                color:kgreyColor,
                              ),
                              ),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset('assets/13.png',scale: 8,),
                                      kwidth5,
                                       Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('Temp max',
                                          
                                          style: TextStyle(
                                            color: kwhiteColor,
                                            fontWeight: FontWeight.w300
                                          ),
                                          ),
                                          kheight3,
                                          Text('${state.weather.tempMax!.celsius!.round()}°C',
                                          
                                          style: const TextStyle(
                                            color: kwhiteColor,
                                            fontWeight: FontWeight.w700
                                          ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset('assets/14.png',scale: 8,),
                                      kwidth5,
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('Temp min',
                                          
                                          style: TextStyle(
                                            color: kwhiteColor,
                                            fontWeight: FontWeight.w300
                                          ),
                                          ),
                                          kheight3,
                                          Text('${state.weather.tempMin!.celsius!.round()}°C',
                                          
                                          style: const TextStyle(
                                            color: kwhiteColor,
                                            fontWeight: FontWeight.w700
                                          ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                              
                          ),
                        );
                }else{
                  return Container();
                }
              },
            )
          ],
        ),
      ),
      )
    
    );
  }
}