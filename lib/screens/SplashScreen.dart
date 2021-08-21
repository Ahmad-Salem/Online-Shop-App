import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import '../dataProviders/userSettings.dart';

class Splash extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 200),
          child: SvgPicture.asset(
            "assets/shopping-cart.svg",
            width: width * 0.4,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            "We Save Your Time",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Theme.of(context).primaryColor),
          ),
        ),
        Expanded(
          child: Container(
            padding:EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "All Rights Reserved 2021.",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ),
      ]),

      //Image.asset('assets/photo_logo_design.png'),
    );
  }
}

class Init {
  Init._();

  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(Duration(seconds: 5));
  }
}
//
// Container(
// width: double.infinity,
// height: double.infinity,
// decoration: BoxDecoration(
// gradient: LinearGradient(
// begin: Alignment.topRight,
// end: Alignment.bottomLeft,
// colors: [
// Colors.white,
// Colors.white,
// ],
// ),
// ),
// child:
