import 'package:guitarshop/screens/guitars_screen.dart';
import 'package:flutter/material.dart';
import 'package:guitarshop/screens/explore_screen.dart';
import 'package:guitarshop/models/models.dart';
import 'package:provider/provider.dart';
import 'package:guitarshop/screens/cart_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List pages = [
    ExploreScreen(),
    GuitarScreen(),
    const CartScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(builder: (
      context,
      tabManager,
      child,
    ) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Guitar Crowd'),
          centerTitle: true,
          backgroundColor: Colors.black45,
        ),
        body: pages[tabManager.selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.deepOrange,
          currentIndex: tabManager.selectedTab,
          backgroundColor: Colors.black45,
          onTap: (index) {
            tabManager.goToTab(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.music_note,
              ),
              label: 'GUITARS',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: 'CART',
            ),
          ],
        ),
      );
    });
  }
}
