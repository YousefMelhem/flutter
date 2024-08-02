// lib/models/forecast.dart
import 'weather.dart'; // Assuming the Weather class is defined in a separate file called 'weather.dart'

class Forecast {
  final List<Weather> hourly;

  Forecast({required this.hourly});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
    List<Weather> hourlyList = list.map((i) => Weather.fromJson(i)).toList();
    return Forecast(hourly: hourlyList);
  }
}
