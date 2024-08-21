import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/splash_screen.dart';
import 'package:weather_app/screens/status.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, routes: {
    '/': (context) => const SplashScreen(),
    '/home': (context) => const Home(),
    '/splash': (context) => const SplashScreen(),
    '/status': (context) => const StatusScreen(),

  }));
}
