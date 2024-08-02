import 'package:intl/intl.dart';

class Weather {
  final String city;
  final String description;
  final String icon;
  final double temperature;
  final DateTime time;

  Weather({
    required this.description,
    required this.icon,
    required this.temperature,
    required this.time,
    required this.city,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name']??'',
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      temperature: json['main']['temp'].toDouble(),
      time: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
    );
  }
}
