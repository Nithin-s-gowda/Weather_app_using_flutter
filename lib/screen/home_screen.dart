import 'dart:ui'; // Required for ImageFilter
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';
//import 'package:weather_app/consts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget getWeatherIcon(int code){
    switch(code){
      case >=200 && < 300:
        return Image.asset('assets/1.png');
      case >=300 && < 400:
        return Image.asset('assets/2.png');

      case >=500 && < 600:
        return Image.asset('assets/3.png');
      case >=600 && < 700:
        return Image.asset('assets/4.png');
      case == 800:
        return Image.asset('assets/6.png');
      case >=700 && < 800:
        return Image.asset('assets/5.png');
      case >800 && <= 805:
        return Image.asset('assets/7.png');
      default:
        return Image.asset('assets/7.png');

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(10, -0.3), // Adjusted alignment for a more visible position
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-10, -0.3), // Adjusted alignment for a more visible position
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -1.2),
                  child: Container(
                    height: 300,
                    width: 600,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFAB40),
                    ),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0), // Fixed syntax for blur
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                  ),
                ),
                BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                  builder: (context,state){
                    if(state is WeatherBlocSuccess) {
                      return SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              '${state.weather.areaName}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400
                              ),

                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Good Morning',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),

                            ),

                            getWeatherIcon(state.weather.weatherConditionCode!),
                            //Image.asset(
                              //  'assets/1.png'
                           // ),
                            Center(
                              child: Text('${state.weather.temperature!.celsius!.round()}°C',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 55,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                             Center(
                              child: Text(state.weather.weatherMain!.toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                             Center(
                              child: Text(
                                DateFormat('EEEE dd *').add_jm().format(state.weather.date!),
                                //'Friday 16 09.41 am',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/11.png',
                                      scale: 18,),
                                    const SizedBox(width: 5),
                                     Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                      const  Text(
                                          'Sunrise',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          DateFormat().add_jm().format(state.weather.sunrise!),

                                          //'5:34 am',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/12.png',
                                      scale: 18,),
                                    const SizedBox(width: 5),
                                     Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        const Text(
                                          'Sunset',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          DateFormat().add_jm().format(state.weather.sunset!),


                                          //'5:34 pm',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),

                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: Divider(
                                color: Colors.grey,
                              ),
                            ),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/13.png',
                                      scale: 20,),
                                    const SizedBox(width: 5),
                                     Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        const Text(
                                          'Temp Max',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          "${state.weather.tempMax!.celsius!.round().toString()}°C",
                                          //'12 C',
                                          style: const  TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/14.png',
                                      scale: 20,),
                                    const SizedBox(width: 5),
                                     Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        const Text(
                                          'Temp Min',
                                          style:  TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                            "${state.weather.tempMin!.celsius!.round().toString()}°C",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

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
        ),
      ),
    );
  }
}
