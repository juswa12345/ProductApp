import 'package:guitarshop/models/models.dart';
import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  final ExploreGuitar guitars;
  const Card1({Key? key, required this.guitars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(
          width: 500,
          height: 350,
        ),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/guitar_card1.jpg'),
                fit: BoxFit.cover,
            ),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
    );
  }
}
