import 'package:guitarshop/models/models.dart';
import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  final ExploreGuitar guitars;
  const Card2({Key? key, required this.guitars}) : super(key: key);

  final String category = 'Guitars';
  final String title = 'Head';
  final String description = 'MUSIC is <3';
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
        //         child: Text(chef, style: TextStyle(
        //           fontWeight: FontWeight.bold,
        //           fontSize: 20,
        //         ),),
        //       left: 75.0,
        //     ),
        //     Positioned(
        //       child: Icon(Icons.favorite_border, size: 30.0, color: Colors.black,),
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
        //       ),),
        //       bottom: 5,
        //       right: 0,
        //     ) ,
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
            image: AssetImage('images/acoustic_cover.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
    );
  }
}
