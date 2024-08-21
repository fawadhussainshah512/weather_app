import 'dart:convert';

import 'package:http/http.dart';

class worker {
  String location;

  worker({required this.location}) {
    location = this.location;
  }

  late String weather_main;
  late String weather_description;
  late String temperature;
  late String wind_speed;
  late String humidity;
  var icon;
  late String name;

  Future<void> getData() async {
    try {
      var url = Uri.parse(
          'give url here');
      var response = await get(url);
      Map data = jsonDecode(response.body);
      print(data);
      //getting weather_main

      List weather = data['weather'];
      Map weather_data = weather[0];
      var weather_type = weather_data['main'];

//getting weather_description
      var weather_desc = weather_data['description'];

//getting temperature

      Map main = data['main'];
      var temp = main['temp']-273.15;//degree celsius

//getting wind speed

      Map wind = data['wind'];
      var speed = wind['speed']*3.6;//km/h

//getting location
      var locate = data['name'];

      //getting humidity
      var humid = main['humidity'];//percentage


      //getting icon
      var get_icon=weather_data["icon"];

      //getting name
      var get_name=data["name"];



      //assigning values
      weather_main = weather_type;
      weather_description = weather_desc;
      temperature = temp.toStringAsFixed(2);
      wind_speed = speed.toStringAsFixed(2);
      location = locate;
      humidity = humid.toString();
      icon=get_icon;
      name=get_name;

    } catch (e) {
      weather_main = "NA";
      weather_description = "NA";
      temperature = "NA";
      wind_speed = "NA";
      location = "NA";
      humidity = "NA";

    }
  }
}
