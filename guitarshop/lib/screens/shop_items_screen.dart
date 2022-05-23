import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guitarshop/models/cart_tile.dart';
import 'package:guitarshop/models/models.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:guitarshop/components/guitar_tile.dart';

class CartItemScreen extends StatefulWidget {
  final Function(GuitarItem) onCreate;
  final Function(GuitarItem) onUpdate;

  final GuitarItem? originalItem;

  final bool isUpdating;

  const CartItemScreen({
    Key? key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  })  : isUpdating = (originalItem != null),
        super(key: key);

  @override
  State<CartItemScreen> createState() => _CartItemScreenState();
}

class _CartItemScreenState extends State<CartItemScreen> {
  final _controller = TextEditingController();
  String _id = '';
  String _name = '';
  Variation _variation = Variation.vintage;
  DateTime _orderDate = DateTime.now();
  TimeOfDay _timeNow = TimeOfDay.now();
  Color _color = Colors.teal;
  int _quantity = 1;
  String _path = '';

  int variationIndex = 0;
  int price = 0;
  int container = 0;

  List _guitarList = [];
  String? dropDownValue;
  final List<String> _newGuitarList = [];
  List<String> _guitarPrices = [];

  Future<dynamic> getJsonData() async {
    final String response = await rootBundle.loadString('assets/sample_data/sample_guitars.json');
    final data = await json.decode(response);
    setState(() {
      _guitarList = data["guitars"];
    });
    for (int i = 0; i < _guitarList.length; i++) {
      _newGuitarList.add(_guitarList[i]['title'].toString());
    }
  }

  @override
  void initState() {
    final origItem = widget.originalItem;
    if (origItem != null) {
      _id = origItem.id;
      dropDownValue = origItem.name;
      _quantity = origItem.quantity;
      _variation = origItem.variation;
      _color = origItem.color;
      price = origItem.totalPrice;
      final date = origItem.date;
      _path = origItem.path;
      _timeNow = TimeOfDay(hour: date.hour, minute: date.minute);
      _orderDate = date;
    }
    setState(() {
      if (dropDownValue == null) {
        _name = 'Single Cut 335 Guitar';
        _path = 'assets/guitar_app_assets/blank_image.png';
      } else {
        _name = 'Single Cut 335 Guitar';
      }
    });
    getJsonData();
    super.initState();
  }

  String updateImage() {
    for (int i = 0; i < _guitarList.length; i++) {
      if (dropDownValue == _guitarList[i]['title']) {
        _path = _guitarList[i]['guitarImage'];
        return _path;
      }
    }
    _path = 'assets/guitar_app_assets/blank_image.png';
    return _path;
  }

  String updateId(){
    for (int i = 0; i < _guitarList.length; i++) {
      if (dropDownValue == _guitarList[i]['title']) {
        _id = _guitarList[i]['id'];
        return _id;
      }
    }
    _id = "NONE";
    return _id;
  }

  List<String> getPrices(){
    if(_guitarPrices.isNotEmpty){
      _guitarPrices = List.empty(growable: true);
    }
    for (int i = 0; i < _guitarList.length; i++) {
      if (dropDownValue == _guitarList[i]['title']) {
        _guitarPrices.add(_guitarList[i]['price'][0].toString());
        _guitarPrices.add(_guitarList[i]['price'][1].toString());
        _guitarPrices.add(_guitarList[i]['price'][2].toString());
        return _guitarPrices;
      }
    }
    return _guitarPrices;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        actions: [
          IconButton(
            onPressed: () {
              if(dropDownValue != null){
                final shopItem = GuitarItem(
                    id: _id,
                    name: dropDownValue ?? '',
                    variation: _variation,
                    color: _color,
                    quantity: _quantity,
                    totalPrice: price,
                    path: _path,
                    date: DateTime(_orderDate.year, _orderDate.month,
                        _orderDate.day, _orderDate.hour, _orderDate.minute));
                if (widget.isUpdating) {
                  widget.onUpdate(shopItem);
                } else {
                  widget.onCreate(shopItem);
                }
              }
            },
            icon: const Icon(Icons.check),
          ),
        ],
        title: const Text(
          'ADD TO CART',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            GuitarTile(
              item: GuitarItem(
                id: _id,
                name: dropDownValue ?? '',
                variation: _variation,
                color: _color,
                quantity: _quantity,
                totalPrice: price,
                path: _path,
                date: DateTime(_orderDate.year, _orderDate.month,
                    _orderDate.day, _timeNow.hour, _timeNow.minute),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            buildNameField(),
            const SizedBox(
              height: 10.0,
            ),
            buildVariationField(),
            const SizedBox(
              height: 10.0,
            ),
            getPrice(),
            buildQuantityButtons(),
            buildDateField(context),
            buildTimeField(context),
            const SizedBox(
              height: 10.0,
            ),
            buildColorPicker(),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Select an Item',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(width: 4, color: Colors.white60),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropDownValue,
              isExpanded: true,
              iconSize: 30,
              icon: const Icon(
                Icons.arrow_drop_down,
              ),
              items: _newGuitarList.map(buildMenuItem).toList(),
              onChanged: (value) {
                setState(() {
                  dropDownValue = value!;
                  updateImage();
                  getPrices();
                  updateId();
                  price = int.parse(_guitarPrices[variationIndex]);
                  container = price;
                });
              },
            ),
          ),
        )
      ],
    );
  }

  Widget getPrice(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Total Price: '),
        Text('\$ ${price.toString()}'),
      ],
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      );

  Widget buildVariationField() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'VARIATION',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Wrap(
            spacing: 10.0,
            children: [
              ChoiceChip(
                selectedColor: Colors.green,
                label: const Text('Vintage'),
                selected: _variation == Variation.vintage,
                onSelected: (selected) {
                  setState(() {
                    _variation = Variation.vintage;
                    variationIndex = 0;
                    price = int.parse(_guitarPrices[variationIndex]);
                    container = price;
                    _quantity = 1;
                  });
                },
              ),
              ChoiceChip(
                selectedColor: Colors.green,
                label: const Text('Classic'),
                selected: _variation == Variation.classic,
                onSelected: (selected) {
                  setState(() {
                    _variation = Variation.classic;
                    variationIndex = 1;
                    price = int.parse(_guitarPrices[variationIndex]);
                    container = price;
                    _quantity = 1;
                  });
                },
              ),
              ChoiceChip(
                selectedColor: Colors.green,
                label: const Text('Modern'),
                selected: _variation == Variation.modern,
                onSelected: (selected) {
                  setState(() {
                    _variation = Variation.modern;
                    variationIndex = 2;
                    price = int.parse(_guitarPrices[variationIndex]);
                    container = price;
                    _quantity = 1;
                  });
                },
              ),
            ],
          )
        ],
      );

  Widget buildDateField(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'Order Date: ${DateFormat('yyyy-MM-dd').format(_orderDate)}'),
              TextButton(
                onPressed: () async {
                  final currentDate = DateTime.now();
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: currentDate,
                    firstDate: currentDate,
                    lastDate: DateTime(currentDate.year + 5),
                  );

                  setState(() {
                    if (selectedDate != null) {
                      _orderDate = selectedDate;
                    }
                  });
                },
                child: Text(
                  'Select',
                  style: TextStyle(
                    color: _color,
                  ),
                ),
              )
            ],
          ),
        ],
      );

  Widget buildTimeField(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Time of Day: ${_timeNow.format(context)}'),
              TextButton(
                onPressed: () async {
                  final timeOfDay = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  setState(() {
                    if (timeOfDay != null) {
                      _timeNow = timeOfDay;
                    }
                  });
                },
                child: Text(
                  'Select',
                  style: TextStyle(
                    color: _color,
                  ),
                ),
              ),
            ],
          ),
        ],
      );

  Widget buildColorPicker() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                color: _color,
              ),
              const SizedBox(
                width: 8.0,
              ),
              const Text('Color'),
              TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: BlockPicker(
                            pickerColor: Colors.white,
                            onColorChanged: (color) {
                              setState(() {
                                _color = color;
                              });
                            },
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Save'),
                            )
                          ],
                        );
                      });
                },
                child: Text(
                  'Select',
                  style: TextStyle(
                    color: _color,
                  ),
                ),
              )
            ],
          ),
        ],
      );

  Widget buildQuantityButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Quantity'),
          const SizedBox(
            width: 16.0,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                if (_quantity < 2) {
                  _quantity = 1;
                } else {
                  _quantity -= 1;
                  price = price - container;
                }
              });
            },
            child: Icon(
              Icons.remove,
              color: _color,
            ),
          ),
          Text(_quantity.toInt().toString()),
          TextButton(
            onPressed: () {
              setState(() {
                _quantity += 1;
                price = container * _quantity;
              });
            },
            child: Icon(
              Icons.add,
              color: _color,
            ),
          ),
        ],
      );
}
