import 'package:flutter/foundation.dart';

class userSettings with ChangeNotifier, DiagnosticableTreeMixin {
  String _user_gov="";
  String _user_city="";
  List<String> country = ["North Sinai",];

  List<String> city = ["alarish"];



  String get user_gov => _user_gov;
  String get user_city => _user_city;

  void set_gov(String gov) {
    _user_gov=gov;
    notifyListeners();
  }


  void set_city(String city) {
    _user_city=city;
    notifyListeners();
  }


  bool getfirst_use() {
    for (int i = 0; i < country.length; i++) {
      if (user_gov == country[i]) {
        return false;

      }else{
        return true;
      }
    }
    return true;
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty("Government", user_gov));
    properties.add(StringProperty("CITY", user_city));
  }
}