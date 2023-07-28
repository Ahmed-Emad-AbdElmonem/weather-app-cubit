class WeatherModel {
   String? date;
   double temp;
   double minTemp;
   double maxTemp;
   String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherStateName});

 
    factory  WeatherModel.fromJson(dynamic data){
      
      return WeatherModel(
        date: data['location']['localtime'] , 
        temp: data['forecast']['forecastday'][0]['day']['avgtemp_c'], 
        minTemp: data['forecast']['forecastday'][0]['day']['mintemp_c']  , 
        maxTemp: data['forecast']['forecastday'][0]['day']['maxtemp_c'], 
        weatherStateName: data['forecast']['forecastday'][0]['day']['condition']['text']);

      }
}
