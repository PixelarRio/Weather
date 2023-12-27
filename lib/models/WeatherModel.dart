class WeatherModel {
  final String cityName;
  final double temperature;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.temperature,
      required this.weatherCondition});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        cityName: json["name"],
        temperature: json["main"]["temp"],
        weatherCondition: json["weather"][0]["main"]);
  }
}
