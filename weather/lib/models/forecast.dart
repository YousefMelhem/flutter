import 'weather.dart'; 
class Forecast {
  final String city;
  final List<Weather> hourly;

  Forecast({required this.city, required this.hourly});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
    List<Weather> hourlyList = list.map((i) => Weather.fromJson(i)).toList();
    String cityName = json['city']['name'];
    return Forecast(city: cityName, hourly: hourlyList);
  }
}
