import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:guitarshop/models/reciept_tile.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:guitarshop/models/cart_tile.dart';
import 'package:guitarshop/models/models.dart';
import 'package:guitarshop/components/guitar_tile.dart';
import 'package:guitarshop/screens/shop_items_screen.dart';
import 'package:lottie/lottie.dart';


class ShopListScreen extends StatefulWidget {
  final ShopManager manager;

  final GuitarItem? originalItem;
  const ShopListScreen({
    Key? key,
    required this.manager,
    this.originalItem,
  }) : super(key: key);

  @override
  State<ShopListScreen> createState() => _ShopListScreenState();
}

class _ShopListScreenState extends State<ShopListScreen> {

  String name = 'SELECT ALL';

  @override
  Widget build(BuildContext context) {
    final cartItems = widget.manager.guitarItems;
    int total = 0;
    final currency = NumberFormat("#,##0.00", "en_US");
    for (int i = 0; i < widget.manager.guitarItems.length; i++) {
      if (widget.manager.guitarItems[i].isComplete == true) {
        total = total + widget.manager.guitarItems[i].totalPrice;
      }
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Positioned(
                child: TextButton(
                  onPressed: () {
                    if(name == 'SELECT ALL') {
                      for (int i = 0; i < widget.manager.guitarItems.length; i++) {
                        widget.manager.completeItem(i, true);
                      }
                      setState(() {
                        name = 'DESELECT ALL';
                      });
                    } else {
                      for (int i = 0; i < widget.manager.guitarItems.length; i++) {
                        widget.manager.completeItem(i, false);
                      }
                      setState(() {
                        name = 'SELECT ALL';
                      });
                    }
                  },
                  child: Text(name),
                ),
                left: 50,
              ),
              Positioned(
                child: TextButton(
                  onPressed: () {
                    for (int i = 0; i < widget.manager.guitarItems.length; i++) {
                      if (widget.manager.guitarItems[i].isComplete) {
                        widget.manager.deleteItem(i);
                      }
                    }
                  },
                  child: const Icon(
                    Icons.delete_forever_rounded,
                    size: 25,
                  ),
                ),
              ),
              Positioned(
                child: MaterialButton(
                  textColor: Colors.white,
                  child: const Text(
                    'BUY',
                  ),
                  color: Colors.deepOrange,
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            'RECEIPT',
                            textAlign: TextAlign.center,
                          ),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                const Text(
                                  '-------------------',
                                  style: TextStyle(
                                    letterSpacing: 10.0,
                                  ),
                                ),
                                for (int i = 0; i < widget.manager.guitarItems.length; i++)
                                  Column(
                                    children: [
                                      if (widget.manager.guitarItems[i].isComplete == true)
                                        Row(
                                          children: [
                                            Text(
                                              'Item: ${widget.manager.guitarItems[i].id} x ${widget.manager.guitarItems[i].quantity}',
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              ' . . . . . . . \$${currency.format(widget.manager.guitarItems[i].totalPrice)}',
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                            )
                                          ],
                                        ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              color: Colors.red,
                              child: const Text('CANCEL'),
                              shape: const StadiumBorder(),
                            ),
                            MaterialButton(
                              onPressed: () {
                                for (int i = 0; i < widget.manager.guitarItems.length; i++) {
                                  if (widget.manager.guitarItems[i].isComplete == true) {
                                    widget.manager.deleteItem(i);
                                  }
                                }
                                Navigator.pop(context, 'Cancel');
                              },
                              color: Colors.green,
                              child: const Text('CONFIRM'),
                              shape: const StadiumBorder(),
                            )
                          ],
                        );
                      },
                    );
                  },
                  shape: const StadiumBorder(),
                ),
                right: 10,
              ),
            ],
          ),
          const SizedBox(
            width: 12.0,
          ),
          Text(
            'TOTAL: \$ ${currency.format(total)}',
            style: const TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.end,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Expanded(
            child: Scrollbar(
              isAlwaysShown: true,
              showTrackOnHover: true,
              hoverThickness: 15,
              radius: const Radius.circular(20),
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Dismissible(
                    key: Key(item.id),
                    direction: DismissDirection.horizontal,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.delete_forever_rounded,
                        size: 50.0,
                        color: Colors.white,
                      ),
                    ),
                    onDismissed: (direction) {
                      widget.manager.deleteItem(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${item.name} removed'),
                          duration: const Duration(seconds: 5),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              widget.manager.addItem(item);
                            },
                          ),
                        ),
                      );
                    },
                    child: InkWell(
                      child: CartTile(
                        item: item,
                        key: Key(item.id),
                        onComplete: (change) {
                          if (change != null) {
                            widget.manager.completeItem(index, change);
                          }
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartItemScreen(
                              originalItem: item,
                              // onCreate will not be called since you are updating an existing item
                              onCreate: (item) {},
                              // GroceryItemScreen calls onUpdate when the user updates an item
                              onUpdate: (item) {
                                // GroceryManager updates the item at the particular index
                                widget.manager.updateItem(item, index);
                                // Dismisses GroceryItemScreen
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 16.0,
                  );
                },
                itemCount: cartItems.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
