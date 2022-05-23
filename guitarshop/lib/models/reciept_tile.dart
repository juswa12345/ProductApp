import 'package:flutter/material.dart';
import 'package:guitarshop/models/guitar_items.dart';
import 'package:intl/intl.dart';
import 'package:guitarshop/models/models.dart';

class ReceiptTile extends StatelessWidget {
  final GuitarItem item;
  final Function(bool?)? onComplete;
  final TextDecoration textDecoration;

  ReceiptTile({
    Key? key,
    required this.item,
    this.onComplete,
  })  : textDecoration =
  item.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // Todo: Change this Widget
    final currency = NumberFormat("#,##0.00", "en_US");
    return SizedBox(
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 5.0,
                color: item.color,
              ),
              const SizedBox(
                width: 10.0,
              ),
              // Container(
              //   height: 50,
              //   width: 50,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage(item.path),
              //       fit: BoxFit.cover,
              //     ),
              //     borderRadius: const BorderRadius.all(Radius.circular(5)),
              //   ),
              // ),
              // const SizedBox(
              //   width: 10.0,
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(decoration: textDecoration),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$${currency.format(item.totalPrice).toString()}',
                style: TextStyle(decoration: textDecoration),
              ),
              Row(
                children: [
                  Text(
                    'Quantity: ${item.quantity}',
                    style: TextStyle(decoration: textDecoration),
                  ),
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
