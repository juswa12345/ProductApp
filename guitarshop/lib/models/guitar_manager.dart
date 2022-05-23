import 'package:flutter/material.dart';
import 'package:guitarshop/models/guitar_items.dart';

class ShopManager extends ChangeNotifier{

  final _guitarItems = <GuitarItem>[];

  List<GuitarItem> get guitarItems => List.unmodifiable(_guitarItems);

  void deleteItem(int index){
    _guitarItems.removeAt(index);
    notifyListeners();
  }

  void addItem(GuitarItem item){
    _guitarItems.add(item);
    notifyListeners();
  }

  void updateItem(GuitarItem item, int index){
    _guitarItems[index] = item;
    notifyListeners();
  }

  void completeItem(int index, bool change){
    final item = _guitarItems[index];
    _guitarItems[index] = item.copyWith(isComplete: change);
    notifyListeners();
  }

}