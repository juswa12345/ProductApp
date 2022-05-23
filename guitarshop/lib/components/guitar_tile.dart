import 'package:flutter/material.dart';
import 'package:guitarshop/models/guitar_items.dart';
import 'package:intl/intl.dart';
import 'package:guitarshop/models/models.dart';

class GuitarTile extends StatelessWidget {
  final GuitarItem item;
  final Function(bool?)? onComplete;
  final TextDecoration textDecoration;

  GuitarTile({
    Key? key,
    required this.item,
    this.onComplete,
  })  : textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(item.path),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 10,
                    color: item.color,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(
                          decoration: textDecoration,
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      buildDate(),
                      const SizedBox(
                        height: 4.0,
                      ),
                      buildVariation(),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Quantity: ${item.quantity.toString()}',
                    style: TextStyle(decoration: textDecoration),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  buildCheckBox()
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Todo: add buildVariation()
  Widget buildVariation() {
    if (item.variation == Variation.classic) {
      return Text(
        'CLASSIC',
        style: TextStyle(
          decoration: textDecoration,
        ),
      );
    }
    if (item.variation == Variation.vintage) {
      return Text(
        'VINTAGE',
        style: TextStyle(
          decoration: textDecoration,
        ),
      );
    }
    if (item.variation == Variation.modern) {
      return Text(
        'MODERN',
        style: TextStyle(
          decoration: textDecoration,
        ),
      );
    }

    throw Exception('This Importance type does not Exist.');
  }

  Widget buildDate() {
    final dateFormatter = DateFormat('MMMM dd h:mm a');
    final dateString = dateFormatter.format(item.date);
    return Text(
      dateString,
      style: TextStyle(decoration: textDecoration),
    );
  }

  // Todo: add buildDate()

  Widget buildCheckBox() {
    return Checkbox(
      value: item.isComplete,
      onChanged: onComplete,
    );
  }
// Todo:  add buildCheckBox()
}
