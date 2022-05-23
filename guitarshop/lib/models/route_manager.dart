import 'package:flutter/material.dart';
import 'package:guitarshop/main.dart';
import 'package:guitarshop/screens/main_screen.dart';

class RouteGenerator {
  static const String welcomePage = '/welcomePage';
  static const String mainPage = '/homePage';
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case welcomePage:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case mainPage:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text(
            'Error Page: 404',
          ),
        ),
      );
    });
  }
}
