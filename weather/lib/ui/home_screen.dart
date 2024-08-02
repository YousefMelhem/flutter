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
                  child: TextField(
                    controller: _cityController,
                    decoration: InputDecoration(
                      hintText: 'Enter city nam',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 19, 18, 18)
                          .withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Rounded corners
                        borderSide: BorderSide.none, // No border
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 5.0), // Padding inside the TextField
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
