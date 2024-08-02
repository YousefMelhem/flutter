import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/weather_service.dart';
import '../models/forecast.dart';
import 'package:geolocator/geolocator.dart';
import 'weather_display.dart';

class ForecastScreen extends StatefulWidget {
  final String city;

  ForecastScreen({required this.city});

  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  Forecast? _forecast;
  bool _isLoading = false;
  String? _errorMessage;
  String? _locationDisplay;

  @override
  void initState() {
    super.initState();
    _fetchForecast();
  }

  Future<void> _fetchForecast() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      if (widget.city.isNotEmpty) {
        _locationDisplay = widget.city;
        final forecast = await context
            .read<WeatherService>()
            .fetchHourlyForecastByCity(widget.city);
        setState(() {
          _forecast = forecast;
        });
      } else {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        _locationDisplay =
            '${position.latitude.toString()}, ${position.longitude.toString()}';
        final forecast = await context
            .read<WeatherService>()
            .fetchHourlyForecast(
                position.latitude.toString(), position.longitude.toString());
        setState(() {
          _forecast = forecast;
        });
      }
    } catch (e) {
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
        title: Text('Weather Forecast'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : _errorMessage != null
                ? Text(_errorMessage!, style: TextStyle(color: Colors.red))
                : _forecast != null
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'City: $_locationDisplay',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: _forecast!.hourly.length,
                              itemBuilder: (context, index) {
                                return WeatherDisplay(
                                    weather: _forecast!.hourly[index]);
                              },
                            ),
                          ),
                        ],
                      )
                    : Text('No forecast data'),
      ),
    );
  }
}
