import 'package:dio/dio.dart';

class WeatherRemoteDaraSource {
  Future<Map<String, dynamic>?> getWeatherData({
    required String city,
  }) async {
    // http://api.weatherapi.com/v1/current.json?key=af6f4fff1e894844a56145545222801&q=Bartoszyce&aqi=no
    final response = await Dio().get<Map<String, dynamic>>(
        'http://api.weatherapi.com/v1/current.json?key=af6f4fff1e894844a56145545222801&q=$city&aqi=no');

    return response.data;
  }
}
