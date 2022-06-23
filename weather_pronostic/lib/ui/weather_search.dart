import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_pronostic/bloc/weather_bloc.dart';
import 'package:weather_pronostic/model/weather.dart';

class WeatherSearch extends StatefulWidget {
  @override
  _WeatherSearchState createState() => _WeatherSearchState();
}

class _WeatherSearchState extends State<WeatherSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Pronostic"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state is WeatherError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is WeatherInitial) {
              return buildInitialInput();
            } else if (state is WeatherLoading) {
              return buildLoading();
            } else if (state is WeatherLoaded) {
              //return buildColumnWithData(state.weather);
              return ShowDetailsWeather(state.weather);
            } else {
              // (state is WeatherError)
              return buildInitialInput();
            }
          },
        ),
      ),
    );
  }

  Widget buildInitialInput() {
    return Center(
      child: CityInputField(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget ShowDetailsWeather(Weather weather){
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        CityInputField(),
        Text(
          weather.cityName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 90,
            fontWeight: FontWeight.w700,
          ),
        ),
        Divider(
          height: 50,
          indent: 60,
          endIndent: 60,),
        ListTile(
          leading: Icon(
            Icons.wb_twilight_sharp,

            size: 60,
          ),
          title: Text(
            "Today",
            style: TextStyle(fontSize: 30),
          ),
          subtitle: Text(
            "${weather.temperatureCelsius.toStringAsFixed(1)} °C  "
                " ${weather.temperatureFahrenheit.toStringAsFixed(1)} °F",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Divider(height: 50,),
        ListTile(
          leading: Icon(
            Icons.wb_sunny,
            size: 60,
          ),
          title: Text(
            "Yesterday",
            style: TextStyle(fontSize: 30),
          ),
          subtitle: Text(
            "${weather.yesterdayTemperatureCelsius.toStringAsFixed(1)} °C  "
                " ${weather.yesterdayTemperatureFahrenheit.toStringAsFixed(1)} °F",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Divider(height: 50,),
        ListTile(
          leading: Icon(
            Icons.wb_sunny,
            size: 60,
          ),
          title: Text(
            "Tomorrow",
            style: TextStyle(fontSize: 30),
          ),
          subtitle: Text(
            "${weather.tomorrowTemperatureCelsius.toStringAsFixed(1)} °C  "
                " ${weather.tomorrowTemperatureFahrenheit.toStringAsFixed(1)} °F",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Divider(height: 50,),
      ],
    );
  }
}

class CityInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitCityName(context, value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  void submitCityName(BuildContext context, String cityName) {
    final weatherBloc = context.bloc<WeatherBloc>();
    weatherBloc.add(GetWeather(cityName));
  }
}
