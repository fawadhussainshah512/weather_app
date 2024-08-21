import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

import '../worker/worker.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late String temperature;
  late String humidity;
  late String main_weather;
  late String weather_description;
  late String wind_speed;
  late String city="islamabad";
  late String name;
  var icon;

  void printData(String city) async {
    worker instance = worker(location: city);
    await instance.getData();
    temperature = instance.temperature;
    humidity = instance.humidity;
    main_weather = instance.weather_main;
    weather_description = instance.weather_description;
    wind_speed = instance.wind_speed;
    icon=instance.icon;
    name=instance.name;
    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temperature": temperature,
        "humidity": humidity,
        "main_weather": main_weather,
        "weather_description": weather_description,
        "wind_speed": wind_speed,
        "icon":icon,
        "name":name

      });
    });

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context)!.settings.arguments;
    Map? cityData=args as Map?;
    if(cityData?.isNotEmpty ?? false){
      city=cityData!["city"].toString();
    }
    printData(city);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
      ),
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue.shade50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xff6190E8),
                    Color(0xffA7BFE8),

              ],
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            height: 100,
            width: 100,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('assets/images/weather_logo.png'),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Weather App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 10),
          SpinKitWave(
            color: Colors.green,
            size: 30.0,
          )
        ],
      ),
    ));
  }
}
