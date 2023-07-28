import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waether_app/cubits/weather_cubit.dart';
import 'package:waether_app/models/weather_model.dart';
import 'package:waether_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  String? cityName;
  WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Search a City',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.cyanAccent ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                onChanged: (value) {
                  cityName = value;
                },
                onFieldSubmitted: (value) async {
                  cityName = value;
                  if (cityName == null ||
                      cityName!.isEmpty &&
                          BlocProvider.of<WeatherCubit>(context).weatherModel ==
                              null) {
                    return null;
                  } else {
                    BlocProvider.of<WeatherCubit>(context).cityName = cityName;
                    BlocProvider.of<WeatherCubit>(context)
                        .getWeather(cityName: cityName!);
    
                    Navigator.pop(context);
                  }
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 24,
                  ),
                  suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        if (cityName == null ||
                            cityName!.isEmpty &&
                                BlocProvider.of<WeatherCubit>(context)
                                        .weatherModel ==
                                    null) {
                          return null;
                        } else {
                          BlocProvider.of<WeatherCubit>(context).cityName =
                              cityName;
                          BlocProvider.of<WeatherCubit>(context)
                              .getWeather(cityName: cityName!);
    
                          Navigator.pop(context);
                        }
                      }),
                  label: const Text(
                    'search',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  hintText: 'Enter a city',
                  hintStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  suffixIconColor: Colors.white,
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(Checkbox.width),
                      )),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(color: Colors.black)),
                ),
                cursorColor: Colors.white,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
