class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double minTemp;
  final double maxtemp;
  final String weatherCondition;

  WeatherModel({required this.cityName, required this.date, this.image, required this.temp, required this.minTemp, required this.maxtemp, required this.weatherCondition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json["location"]["name"],
      date: DateTime.parse(json["location"]["localtime"]),
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      maxtemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      weatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
    );
  }
}
