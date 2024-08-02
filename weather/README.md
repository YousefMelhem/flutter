# Weather App

A Flutter application that provides current weather and forecast information for a specified city or the user's current location.

## Getting Started

This project is a starting point for a Flutter application.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- An API key from [OpenWeatherMap](https://openweathermap.org/api)

### Installation

1. **Clone the repository:**

    ```sh
    git clone https://github.com/YousefMohammad/weather.git
    cd weather
    ```

2. **Install dependencies:**

    ```sh
    flutter pub get
    ```

3. **Configure the API key:**

    Open `lib/utils/constants.dart` and replace the placeholder API key with your actual OpenWeatherMap API key:

    ```dart
    const String apiKey = 'YOUR_API_KEY';
    ```

4. **Run the application:**

    ```sh
    flutter run
    ```

