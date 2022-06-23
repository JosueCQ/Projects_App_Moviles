import 'dart:math';

import 'package:weather_pronostic/model/weather.dart';

abstract class WeatherRepository {
  /// Throws [NetworkException].
  Future<Weather> fetchWeather(String cityName);
}

class FakeWeatherRepository implements WeatherRepository {
  late double cachedTempCelsius;
  late double cachedYesterdayTempCelsius;
  late double cachedTomorrowTempCelsius;

  @override
  Future<Weather> fetchWeather(String cityName) {
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 1),
          () {
        final random = Random();

        // Simulate some network exception
        if (random.nextBool()) {
          throw NetworkException();
        }
        // Temperature between 11 and 27.99
        cachedTempCelsius = 11 + random.nextInt(16) + random.nextDouble();
        cachedYesterdayTempCelsius = 11 + random.nextInt(16) + random.nextDouble();
        cachedTomorrowTempCelsius = 11 + random.nextInt(16) + random.nextDouble();
        // Return "fetched" weather
        return Weather(
          cityName: cityName,
          temperatureCelsius: cachedTempCelsius,
          temperatureFahrenheit: cachedTempCelsius * 1.8 + 32,
          yesterdayTemperatureCelsius: cachedYesterdayTempCelsius,
          yesterdayTemperatureFahrenheit: cachedYesterdayTempCelsius * 1.8 + 32,
          tomorrowTemperatureCelsius: cachedTomorrowTempCelsius,
          tomorrowTemperatureFahrenheit: cachedTomorrowTempCelsius * 1.8 + 32,
        );
      },
    );
  }
}

class NetworkException implements Exception {}
