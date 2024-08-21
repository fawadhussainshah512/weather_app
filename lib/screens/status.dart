import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blue.shade50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
          Icon(WeatherIcons.cloudy,size: 200,),
          Center(child: Text('OOPS CANT FIND DATA')),
                ],
              ),
        ));
  }
}
