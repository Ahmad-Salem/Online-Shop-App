import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';


import 'screens/SplashScreen.dart';
import './screens/MainShopsScreen.dart';
import './screens/MainProductsScreen.dart';
import './screens/profile.dart';
import './screens/produtsDetailsScreen.dart';
import './screens/shopsDetailsScreen.dart';
import './screens/introScreens.dart';
import './screens/first_setting.dart';
import './dataProviders/userSettings.dart';
import './widgets/appDrawer.dart';

void main() {
  /* for splashscreen */
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => userSettings()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget{
  String _gov_string = "";

  String _city_string = "";


  bool firstUse = true;




  getSettings(BuildContext ctx) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? UserGov =  prefs.getString('Government');
    final String? UserCity =  prefs.getString('CITY');



    ctx.read<userSettings>().set_gov(UserGov.toString());
    ctx.read<userSettings>().set_city(UserCity.toString());
    print("000000"+ctx.read<userSettings>().user_gov);
    print("000000"+ctx.read<userSettings>().getfirst_use().toString());
    // if((ctx.read<userSettings>().getfirst_use()||ctx.read<userSettings>().getfirst_use()==null))
    // {
    //   Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) => Landing()));
    //   print("oki");
    // }else{
    //   Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) => Nav()));
    //   print("not oki");
    // }

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Init.instance.initialize(),
        builder: (context, AsyncSnapshot snapshot) {
          // Show splash screen while waiting for app resources to load:
          if (snapshot.connectionState == ConnectionState.waiting) {
            getSettings(context);
            return MaterialApp(
                theme: ThemeData(
                  primarySwatch: Colors.blueGrey,
                  primaryColor: HexColor("#78909c"),
                  primaryColorDark: HexColor("#4b636e"),
                  primaryColorLight: HexColor("#a7c0cd"),
                  accentColor: HexColor("#ffffff"),
                ),
                home: Splash());
          } else {

            if((context.read<userSettings>().getfirst_use()||context.read<userSettings>().getfirst_use()==null))
            {
              return MaterialApp(
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    primarySwatch: Colors.blueGrey,
                    primaryColor: HexColor("#78909c"),
                    primaryColorDark: HexColor("#4b636e"),
                    primaryColorLight: HexColor("#a7c0cd"),
                    accentColor: HexColor("#ffffff"),
                  ),
                  // home: ShopsDetails(),

                  home:Landing(),

                  routes: {
                    ProdutsDetails.routeName: (ctx) => ProdutsDetails(),
                    ShopsDetails.routeName: (ctx) => ShopsDetails(),
                    FirstSetting.routeName: (ctx) => FirstSetting(),
                    // Nav.routeName: (ctx) => Nav(),
                    // Landing.routeName: (ctx) => Landing(),
                  });
            }else {
              return MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blueGrey,
                  primaryColor: HexColor("#78909c"),
                  primaryColorDark: HexColor("#4b636e"),
                  primaryColorLight: HexColor("#a7c0cd"),
                  accentColor: HexColor("#ffffff"),
                ),
                // home: ShopsDetails(),

                home:Nav(),

                routes: {
                  ProdutsDetails.routeName: (ctx) => ProdutsDetails(),
                  ShopsDetails.routeName: (ctx) => ShopsDetails(),
                  FirstSetting.routeName: (ctx) => FirstSetting(),
                  // Nav.routeName: (ctx) => Nav(),
                  // Landing.routeName: (ctx) => Landing(),
                });
            }

          }
        });
  }
}

class Nav extends StatefulWidget {
  static const routeName = '/main/second';

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  int count_run=0;
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    MainProductsScreen(),
    Profile(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  void initState() {
    super.initState();

  }

  @override
  void didChangeDependencies() {
    // WidgetsBinding.instance!.addPostFrameCallback((_) => getSettings(context));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // getSettings(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Shop App"),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.apps_outlined,
            ),
            title: Text(
              'Products',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_shopping_cart_outlined,
            ),
            title: Text(
              'Orders',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outlined,
            ),
            title: Text(
              'Profile',
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}
