import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';
class DropDownCity extends StatelessWidget {
  String city_id ;
  List<String> city ;
  bool city_disable ;
  DropDownCity({required this.city_id,required this.city_disable,required this.city});
@override
Widget build(BuildContext context) {
  return Visibility(
    visible: true,
    child: Container(
      padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
      child: DropDownField(
        onValueChanged: (dynamic value) {
          city_id = value;
        },
        hintStyle: TextStyle(fontSize: 12),
        labelStyle: TextStyle(fontSize: 12),
        textStyle: TextStyle(fontSize: 12),
        enabled: city_disable,
        value: city_id,
        required: false,
        hintText: 'Choose a city',
        labelText: 'City',
        items: city,
      ),
    ),
  );
}}
