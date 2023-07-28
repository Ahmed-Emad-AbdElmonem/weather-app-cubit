import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:waether_app/models/weather_model.dart';

class WeatherService {

  
  Future<WeatherModel?> getWeather({required String cityName}) async {
     
    WeatherModel? weatherModel;
  String baseUrl='http://api.weatherapi.com/v1';
  String apiKey='b658303a0e6f46d5ab434449232206';
  try {
  Uri url = Uri.parse(
      '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
  http.Response response = await http.get(url);
  Map<String, dynamic> data = jsonDecode(response.body);
     
   weatherModel = WeatherModel.fromJson(data);
} on Exception catch (e) {
  // TODO
}
return weatherModel;
}  
  
  
  
  


}
