import 'package:flutter/material.dart';
import 'package:nuova_prova_1/home_screen.dart';
import 'package:nuova_prova_1/login_screen.dart';
import 'package:nuova_prova_1/splash.dart';
import 'package:nuova_prova_1/utils/routeNames.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const Splash());
      case RouteName.USER_LOGIN:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteName.Home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
//                  Image.asset('assets/images/error.jpg'),
                  Text(
                    "${settings.name} does not exists!",
                    style: const TextStyle(fontSize: 24.0),
                  )
                ],
              ),
            ),
          ),
        );
    }
  }
}


