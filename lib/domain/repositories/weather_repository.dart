import 'package:dio/dio.dart';
import 'package:simple_weather/domain/models/weather_model.dart';

class WeatherRepository {
  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    // http://api.weatherapi.com/v1/current.json?key=af6f4fff1e894844a56145545222801&q=Bartoszyce&aqi=no
    final response = await Dio().get<Map<String, dynamic>>(
        'http://api.weatherapi.com/v1/current.json?key=af6f4fff1e894844a56145545222801&q=$city&aqi=no');

    final responseData = response.data;
    if (responseData == null) {
      return null;
    }

    final name = responseData['location']['name'] as String;
    final temperature = (responseData['current']['temp_c'] + 0.0) as double;

    return WeatherModel(city: name, temperature: temperature);
  }
}
