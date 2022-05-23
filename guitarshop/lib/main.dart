import 'package:flutter/material.dart';
import 'package:guitarshop/models/models.dart';
import 'package:guitarshop/screens/welcome_screen.dart';

void main() => runApp(const GuitarApp());

class GuitarApp extends StatelessWidget {
  const GuitarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',
      home: const WelcomeScreen(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcomePage',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainWelcomeScreen(),
    );
  }
}

