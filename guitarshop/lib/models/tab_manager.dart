import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class TabManager extends ChangeNotifier{
  int selectedTab = 0;

  void goToTab(index){
    selectedTab = index;
    notifyListeners();
  }

  void goToGuitarChart(){
    selectedTab = 1;
    notifyListeners();
  }
}