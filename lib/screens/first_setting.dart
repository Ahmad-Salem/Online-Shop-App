import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';



import '../main.dart';
import '../widgets/drop_down_city.dart';
import '../dataProviders/userSettings.dart';
import 'dart:async';

import 'SplashScreen.dart';

class FirstSetting extends StatefulWidget {
  static const routeName = '/First_Setting';

  @override
  _FirstSettingState createState() => _FirstSettingState();
}

class _FirstSettingState extends State<FirstSetting> {
  Future<SharedPreferences> get prefs => _prefs;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String _Government="";

  String _City="";

  setting_gov(BuildContext ctx) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() async {
      _Government=await prefs.setString('Government', country_id).toString();
      print("test55:"+_Government.toString());
      _City=await prefs.setString('CITY', city_id).toString();
      print("test55:"+_City.toString());
      ctx.read<userSettings>().set_gov(country_id);
      ctx.read<userSettings>().set_city(city_id);

    });
  }



  void GoToMAin(BuildContext ctx) {
    setting_gov(ctx);
    Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) => MyApp()));
  }

  String country_id = "";
  String city_id = "";

  List<String> country = [
    "North Sinai",
  ];

  // List<String> country = [
  //   // "Alexandria",
  //   // "Assiut",
  //   // "Aswan",
  //   // "Beheira",
  //   // "Bani Suef",
  //   // "Cairo",
  //   // "Daqahliya",
  //   // "Damietta",
  //   // "Fayyoum",
  //   // "Gharbiya",
  //   // "Giza",
  //   // "Helwan",
  //   // "Ismailia",
  //   // "Kafr El Sheikh",
  //   // "Luxor",
  //   // "Marsa Matrouh",
  //   // "Minya",
  //   // "Monofiya",
  //   // "New Valley",
  //   "North Sinai",
  //   // "Port Said",
  //   // "Qalioubiya",
  //   // "Qena",
  //   // "Red Sea",
  //   // "Sharqiya",
  //   // "Sohag",
  //   // "South Sinai",
  //   // "Suez",
  //   // "Tanta",
  // ];
  List<String> city = ["alarish"];
  bool city_disable = false;

  @override
  Widget build(BuildContext context) {
    /*Disable city dropdown*/
    setState(() {
      print(country_id);
      if (country_id.isNotEmpty) {
        city_disable = !city_disable;
      }
    });
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Initial Settings",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50),
                child: SvgPicture.asset(
                  "assets/location.svg",
                  width: width * 0.4,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: DropDownField(
                  onValueChanged: (dynamic value) {
                    country_id = value;
                  },
                  hintStyle: TextStyle(fontSize: 12),
                  labelStyle: TextStyle(fontSize: 12),
                  textStyle: TextStyle(fontSize: 12),
                  value: country_id,
                  required: false,
                  hintText: 'Choose a country',
                  labelText: 'Country',
                  items: country,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DropDownCity(city_id:city_id,city_disable: city_disable,city:city),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 35,
                width: width * 0.4,
                child: GestureDetector(
                  child: FlatButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      GoToMAin(context);
                    },
                    textColor: Colors.white,
                    child: Text("Go To Main Page"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
