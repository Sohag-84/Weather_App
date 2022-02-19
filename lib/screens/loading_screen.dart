import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/service/weather.dart';




class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();

}

class _LoadingScreenState extends State<LoadingScreen> {

  // late double latitude;
  // late double longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
    print("init state is called");

  }

 void getLocationData() async {

    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

   Navigator.push(context, MaterialPageRoute(builder: (context){
     return LocationScreen(locationWeather: weatherData,);
   }));


  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitSpinningLines(color: Colors.white,size: 150,),
      ),
    );
  }
}
