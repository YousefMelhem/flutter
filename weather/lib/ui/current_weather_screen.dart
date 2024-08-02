import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import '../services/weather_service.dart';
import '../models/weather.dart';
import 'weather_display.dart';

class CurrentWeatherScreen extends StatefulWidget {
  final String city;

  const CurrentWeatherScreen({required this.city});
  @override
  _CurrentWeatherScreenState createState() => _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends State<CurrentWeatherScreen> {
  Weather? _weather;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchCurrentWeather();
  }



  Future<void> _fetchCurrentWeather() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      if(widget.city.isNotEmpty) {

        //fetch weather by city name
        final weather = await context.read<WeatherService>().fetchCurrentWeatherByCity(widget.city);
        setState(() {
          _weather = weather;
        });
        return;
      }

      else{
        //fetch weather by location
        final Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        final weather = await context.read<WeatherService>().fetchCurrentWeather(
            position.latitude.toString(), position.longitude.toString());
        setState(() {
          _weather = weather;
        });
      } 
    } catch (e) {
      print('Exception: $e');
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Weather'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : _errorMessage != null
                ? Text(_errorMessage!, style: TextStyle(color: Colors.red))
                : _weather != null
                    ? WeatherDisplay(weather: _weather!)
                    : Text('No weather data available'),
      ),
    );
  }
}
