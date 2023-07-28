import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waether_app/cubits/weather_states.dart';
import 'package:waether_app/models/weather_model.dart';
import 'package:waether_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit(this.weatherService) : super(WeatherInitialState());

  WeatherModel? weatherModel;
  WeatherService weatherService;
  String? cityName;
    getWeather({required String cityName})async{
      emit(WeatherLoadingState());
  try { 
     

 weatherModel= await weatherService.getWeather(cityName: cityName)  ;
  emit(WeatherSuccessState());
}     catch (e) {
  emit(WeatherFailureState());
}


  }

  
}
