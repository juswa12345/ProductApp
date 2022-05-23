import 'package:guitarshop/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Card3 extends StatelessWidget {
  final ExploreGuitar guitars;

  const Card3({Key? key, required this.guitars}) : super(key: key);

  final String category = 'TOP SALES';
  final String title = '';
  final String description = 'DUESENBERG';
  final String chef = 'Cardo Dalisay';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // child: Stack(
        //   children: [
        //     CircleAvatar(
        //       radius: 30.0,
        //       backgroundImage: AssetImage('images/sad.jpg'),
        //     ),
        //     Positioned(
        //       child: Text(chef, style: TextStyle(
        //         fontWeight: FontWeight.bold,
        //         fontSize: 20,
        //       ),),
        //       left: 75.0,
        //     ),
        //     Positioned(
        //       child: Icon(
        //         Icons.favorite_border, size: 30.0, color: Colors.black,),
        //       right: 35,
        //     ),
        //     Positioned(
        //       child: Icon(Icons.ios_share, size: 30.0, color: Colors.black,),
        //       right: 0,
        //     ),
        //     Positioned(
        //       child: Text(title, style: TextStyle(
        //         fontSize: 20,
        //       ),),
        //       top: 30,
        //       left: 75.0,
        //     ),
        //     Positioned(
        //       child: Text(description, style: TextStyle(
        //         fontSize: 30,
        //         color: Colors.black,
        //         backgroundColor: Colors.pink.shade100,
        //       ),),
        //       bottom: 5,
        //       right: 0,
        //     ),
        //     Positioned(
        //       child: Text(category, style: TextStyle(
        //         fontSize: 30,
        //       ),),
        //       top: 200.0,
        //     ),
        //   ],
        // ),
        padding: const EdgeInsets.all(16),
        constraints: BoxConstraints.expand(
          width: 500,
          height: 350,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/guitar_duesenberg.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
    );
  }
}

