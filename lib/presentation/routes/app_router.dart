import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:state_mngmt/presentation/screens/home_screen.dart';
import 'package:state_mngmt/presentation/screens/second_screen.dart';
import 'package:state_mngmt/presentation/screens/third_screen.dart';

class AppRouter {
  
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_context) => MyHomePage(
            title: 'HomeScreen',
            color: Colors.blueAccent,
          ),
        );
        break;

      case '/second':
        return MaterialPageRoute(
          builder: (_context) => MySecondPage(
            title: 'SecondScreen',
            color: Colors.redAccent,
          ),
        );
        break;
      case '/third':
        return MaterialPageRoute(
          builder: (_context) => MyThirdPage(
            title: 'ThirdScreen',
            color: Colors.greenAccent,
          ),
        );
        break;
      default:
        return null;
    }
  }


}
