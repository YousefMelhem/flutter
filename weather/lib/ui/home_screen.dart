import 'package:flutter/material.dart';
import 'current_weather_screen.dart';
import 'forecast_screen.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('../assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 200,
                    height: 30,
                    child: TextField(
                      controller: _cityController,
                      decoration: InputDecoration(
                        hintText: 'Enter city name',
                        filled: true,
                        fillColor:
                            Color.fromARGB(255, 223, 212, 212).withOpacity(0.8),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), 
                          borderSide: BorderSide.none, 
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 1.0,
                            horizontal: 5.0), 
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CurrentWeatherScreen(
                                city: _cityController.text,
                              )),
                    );
                  },
                  child: Text('Current Weather'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForecastScreen(
                                city: _cityController.text,
                              )),
                    );
                  },
                  child: Text('Forecast'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
