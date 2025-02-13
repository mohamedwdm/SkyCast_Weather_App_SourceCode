import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService( this.dio);

  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "d1783bb60e2a461a9ce135217241409";

  Future<WeatherModel> getWeather({required cityName}) async {
    try {
      Response response = await dio.get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");

      WeatherModel weathermodel = WeatherModel.fromJson(response.data);
      return weathermodel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["error"]["message"] ?? "there is a problem , try later";
      throw Exception(errorMessage);
    } catch (e) {
      throw ("oops , there was an error , try later");
    }
  }
}
