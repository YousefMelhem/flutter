// lib/ui/weather_display.dart
import 'package:flutter/material.dart';
import '../models/weather.dart';
import 'package:intl/intl.dart';

class WeatherDisplay extends StatelessWidget {
  final Weather weather;

  const WeatherDisplay({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(weather.city,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 219, 207, 207))),
        Image.network(
            'http://openweathermap.org/img/wn/${weather.icon}@2x.png'),
        Text('${weather.temperature}°C',
            style: TextStyle(
                fontSize: 32, color: const Color.fromARGB(255, 219, 207, 207))),
        Text(weather.description,
            style: TextStyle(
                fontSize: 24, color: Color.fromARGB(255, 219, 207, 207))),
        Text(DateFormat('yyyy-MM-dd – kk:mm').format(weather.time),
            style: TextStyle(
                fontSize: 16, color: const Color.fromARGB(255, 219, 207, 207))),
      ],
    );
  }
}
