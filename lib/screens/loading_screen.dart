import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/service/location.dart';
import 'package:weather_app/service/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const apiKey = "31ea942005ebfb33e7f1242a00a16198";

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
   Location location = Location();
   await location.getCurrentLocation(); //we wait for this method until detect the user current location;
   // latitude = location.latitude;
   // longitude = location.longitude;

   Uri uri = Uri.parse("https://api.openweathermap.org/data/2.5/weather?"
       "lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");
   NetworkHelper networkHelper = NetworkHelper(uri);

   var weatherData = await networkHelper.getData();

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
