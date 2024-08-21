import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_app/worker/worker.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var inputController=TextEditingController();


  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments;
    Map? info = args as Map?;

    var temperatue = info?["temperature"];
    var main_weather = info?["main_weather"];
    var weather_description = info?["weather_description"];
    var humidity = info?["humidity"];
    var wind_speed = info?["wind_speed"];
    var icon=info?["icon"];
    var name=info?["name"];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue.shade50,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Container(
                    height: 50,
                    child: TextField(
                      controller: inputController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: GestureDetector(
                          onTap: (){
                            if(inputController.text==""){
                              Navigator.pushReplacementNamed(context, '/status');

                            }else {
                              Navigator.pushReplacementNamed(
                                  context, '/splash', arguments: {
                                "city": inputController.text,
                              });
                            }
                          },
                            child: Icon(Icons.search)),
                        prefixIconColor: Colors.blue,
                        hintText: "Search Any City Here...",
                        hintStyle: TextStyle(color: Colors.black38, fontSize: 15),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25, top: 10),
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff6190E8),
                            Color(0xffA7BFE8),
          
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network("https://openweathermap.org/img/wn/$icon@2x.png"),
          
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  "$main_weather",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              Text(
                                "$weather_description in $name",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize:12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
          
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                  child: Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xff6190E8),
                                Color(0xffA7BFE8),
          
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  Icon(WeatherIcons.thermometer),
                                  Text('TEMPERATURE'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                          "$temperatue",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 50,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                    ),
          
                                    const Center(
                                      child: Text(
                                        "\u00B0C",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ),
                          ],
                        ),
                      ),
                  ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Container(
                        height: 180,
                        width: 142,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xff6190E8),
                                Color(0xffA7BFE8),
          
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Icon(WeatherIcons.humidity),
                                  Text('HUMIDITY'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:50.0,right:30,top:30),
                              child: Text(
                                  "$humidity%",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ),
                          ],
                        ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25),
                      child: Container(
                        height: 180,
                        width: 142,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xff6190E8),
                                Color(0xffA7BFE8),
          
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Icon(WeatherIcons.wind),
                                  Text('WIND SPEED'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:50.0,right:30,top:20),
                              child: Text(
                                  "$wind_speed km/h",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ),
                          ],
                        ),
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );


  }
}
