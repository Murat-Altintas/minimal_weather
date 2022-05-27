import 'dart:convert';
import 'package:http/http.dart' as http;
import 'forecast_response_model.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    // api.weatherapi.com/v1/forecast.json?key=725c3740d0234701968220956221405&q=istanbul&days=3

    final queryParameters = {
      "key": "725c3740d0234701968220956221405",
      "q": city,
      "days": "3",
    };

    final uri =
        Uri.https('api.weatherapi.com', '/v1/forecast.json', queryParameters);

    final response = await http.get(uri);

    final json = jsonDecode(response.body);
    //print(response.body);

    return WeatherResponse.fromJson(json);
  }
}
