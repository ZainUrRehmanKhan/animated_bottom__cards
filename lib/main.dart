import 'package:animated_weather_app/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Weather App',
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
