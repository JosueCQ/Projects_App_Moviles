import 'package:meta/meta.dart';

class Weather {
  final String cityName;
  final double temperatureCelsius;
  final double temperatureFahrenheit;
  final double yesterdayTemperatureCelsius;
  final double yesterdayTemperatureFahrenheit;
  final double tomorrowTemperatureCelsius;
  final double tomorrowTemperatureFahrenheit;

  Weather({
    required this.cityName,
    required this.temperatureCelsius,
    required this.temperatureFahrenheit,
    required this.yesterdayTemperatureCelsius,
    required this.yesterdayTemperatureFahrenheit,
    required this.tomorrowTemperatureCelsius,
    required this.tomorrowTemperatureFahrenheit,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Weather &&
        o.cityName == cityName &&
        o.temperatureCelsius == temperatureCelsius &&
        o.temperatureFahrenheit == temperatureFahrenheit &&
        o.yesterdayTemperatureCelsius == yesterdayTemperatureCelsius &&
        o.yesterdayTemperatureFahrenheit == yesterdayTemperatureFahrenheit &&
        o.tomorrowTemperatureCelsius == tomorrowTemperatureCelsius &&
        o.tomorrowTemperatureFahrenheit == tomorrowTemperatureFahrenheit;
  }

  @override
  int get hashCode => cityName.hashCode ^ temperatureCelsius.hashCode;
}
