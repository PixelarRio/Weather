import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_application/models/WeatherModel.dart';
import 'package:weather_application/services/WeatherService.dart';
import 'package:lottie/lottie.dart';

class WeatherScreen extends StatefulWidget{
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() {
    return _WeatherScreen();
  }

}

class _WeatherScreen extends State<WeatherScreen>{
    final _weatherService = WeatherService("0c852d89faf85f74b57522305612f576");
    WeatherModel? _weather;

    _fetchWeather() async{
      String cityName = await _weatherService.getCurrentCity();
      try{
        final weather = await _weatherService.getWeather(cityName);
        setState(() {
          _weather = weather;
        });
      }catch(e){
        print(e);
      }
    }

    String getWeatherAnimation(String? weatherCondition){
      if(weatherCondition == null) return "assets/animations/sunny.json";

      switch(weatherCondition.toLowerCase()){
        case "clouds":
        case "mist":
        case "smoke":
        case "haze":
        case "dust":
        case "fog" :
          return "assets/animations/cloud.json";
        case "rain":
        case "drizzle":
        case "shower rain":
          return "assets/animations/rain.json";
        case "thunderstrom":
          return "assets/animations/thunder.json";
        case "clear":
          return "assets/animations/sunny.json";
        default:
          return "assets/animations/sunny.json";
      }
    }

    @override
    void initState(){
      super.initState();
      _fetchWeather();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 150)),
            Text(_weather?.cityName?? "Loading City...",style: Theme.of(context).textTheme.bodyLarge,),
            SizedBox(height: 80,),

            Lottie.asset(getWeatherAnimation(_weather?.weatherCondition)),
            Padding(padding: EdgeInsets.only(top: 100)),
            Text(_weather?.weatherCondition?? "",style: Theme.of(context).textTheme.bodyMedium,),


            Text("${_weather?.temperature.round()}°C",style: Theme.of(context).textTheme.bodyLarge),


          ],
        ),
      ),

    );
  }
}
