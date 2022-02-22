import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constraints_file.dart';


class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  late String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child:  TextField(
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    icon: Icon(Icons.location_city,
                      color: Colors.white,
                      size: 50,
                    ),
                    hintText: "Enter the city name..",
                    hintStyle: TextStyle(
                      color: Colors.black
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value){
                    cityName = value;
                  },
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context,cityName);
                },
                child: const Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}