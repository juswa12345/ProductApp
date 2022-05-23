import 'package:flutter/material.dart';
import 'package:guitarshop/home.dart';
import 'package:provider/provider.dart';
import 'package:guitarshop/models/models.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'GuitarCenter',
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TabManager(),),
          ChangeNotifierProvider(create: (context) => ShopManager(),),
        ],
        child: const Home(),
      ),
    );
  }
}
