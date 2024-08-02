import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';
import '../models/forecast.dart';

class WeatherService {
  static const _apiKey = '97a78290ca78f194246486d16f1219dc';
  static const _baseUrl = 'http://api.openweathermap.org/data/2.5';
  // fetch current weather by city name
  Future<Weather> fetchCurrentWeatherByCity(String city) async {
    final url =
        '$_baseUrl/weather?q=$city&appid=$_apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['name'] == null) {
          throw Exception('city name is null');
        }
        return Weather.fromJson(data);
      } else {
        throw Exception(
            'Failed to load weather data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Failed to load weather data: $e');
    }
  }

  // featch current weather by loction
  Future<Weather> fetchCurrentWeather(String latitude, String longitude) async {
    final url =
        '$_baseUrl/weather?lat=$latitude&lon=$longitude&appid=$_apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        //print("Data: $data");
        if (data['name'] == null) {
          throw Exception('city name is null');
        }
        return Weather.fromJson(data);
      } else {
        throw Exception(
            'Failed to load weather data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Failed to load weather data: $e');
    }
  }
  // fetch hourly forecast by city name
  Future<Forecast> fetchHourlyForecastByCity(String city) async {
    final url =
        '$_baseUrl/forecast?q=$city&appid=$_apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Forecast.fromJson(data);
      } else {
        throw Exception(
            'Failed to load forecast data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Failed to load forecast data: $e');
    }
  }
  //fetch hourly forecast by loction 
  Future<Forecast> fetchHourlyForecast(
      String latitude, String longitude) async {
    final url =
        '$_baseUrl/forecast?lat=$latitude&lon=$longitude&appid=$_apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Forecast.fromJson(data);
      } else {
        throw Exception(
            'Failed to load forecast data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Failed to load forecast data: $e');
    }
  }
}
