import 'package:flutter/material.dart';
import 'package:guitarshop/screens/empty_screen.dart';
import 'package:guitarshop/screens/shop_items_screen.dart';
import 'package:guitarshop/screens/shop_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:guitarshop/models/models.dart';

import '../api/mock_guitar_app_service.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final manager = Provider.of<ShopManager>(context, listen: false);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CartItemScreen(
                    onCreate: (item){
                      manager.addItem(item);
                      Navigator.pop(context);
                    },
                    onUpdate: (index){},
                  )
              )
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
      body: buildShopCartScreen(),
    );
  }

  Widget buildShopCartScreen() => Consumer<ShopManager>(
        builder: (context, manager, child) {
          if (manager.guitarItems.isNotEmpty) {
            return ShopListScreen(manager: manager);
          }
          return const EmptyShopScreen();
        },
      );
}
