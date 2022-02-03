import 'package:simple_weather/data/remote_data_sources/wheter_remote_data_source.dart';
import 'package:simple_weather/domain/models/weather_model.dart';

class WeatherRepository {
  WeatherRepository(this._weatherRemoteDaraSource);
  final WeatherRemoteDaraSource _weatherRemoteDaraSource;

  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    final responseData = await _weatherRemoteDaraSource.getWeatherData(
      city: city,
    );
    if (responseData == null) {
      return null;
    }

    final name = responseData['location']['name'] as String;
    final temperature = (responseData['current']['temp_c'] + 0.0) as double;

    return WeatherModel(city: name, temperature: temperature);
  }
}
