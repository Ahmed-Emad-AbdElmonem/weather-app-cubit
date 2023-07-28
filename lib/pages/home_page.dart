import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waether_app/cubits/weather_cubit.dart';
import 'package:waether_app/cubits/weather_states.dart';
import 'package:waether_app/models/weather_model.dart';
import 'package:waether_app/pages/search_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       // backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SearchPage();
                  }),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
          title: const Text('Weather',style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,color: Colors.white),)  ,
        ),
        body: BlocBuilder<WeatherCubit,WeatherStates>(builder: (context, state) {
            if (state is WeatherLoadingState) {
           return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccessState) {
           weatherModel= BlocProvider.of<WeatherCubit>(context).weatherModel;
            return Container(
              decoration:    BoxDecoration(
            gradient: LinearGradient(
              
             colors: [Colors.black, Colors.cyanAccent ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                   '${BlocProvider.of<WeatherCubit>(context).cityName}',
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    'updated at: ${BlocProvider.of<WeatherCubit>(context).weatherModel?.date}',
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('imgs/a.jpg'),
                      Text(
                        '${BlocProvider.of<WeatherCubit>(context).weatherModel?.temp}',
                        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                      Column(
                        children: [
                          Text(
                           '${BlocProvider.of<WeatherCubit>(context).weatherModel?.maxTemp}',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            '${BlocProvider.of<WeatherCubit>(context).weatherModel?.minTemp}',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                   '${BlocProvider.of<WeatherCubit>(context).weatherModel?.weatherStateName}' ,
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                ],
              ),
            );
          } else if (state is WeatherFailureState&&weatherModel==null/*&&BlocProvider.of<WeatherCubit>(context).weatherModel==null*/) {
            return Container(
              decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.cyanAccent ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),),
              child: const Center(
                child: Text(' something wrong  try again !',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,)),
              ),
            );
          } else {
            return Container(
              decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.cyanAccent ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('there is no weather !! ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white,),),
                    SizedBox(
                      height: 3,
                    ),
                    Text('Start searching now',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white,)),
                  ],
                    ),
              ),
            );
          
          } 
        
      })),
    );
  }
}

