import 'package:guitarshop/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guitarshop/models/models.dart';
import 'package:carousel_slider/carousel_slider.dart';


class TodayGuitarListView extends StatelessWidget {
  TodayGuitarListView({Key? key, required this.guitars,}) : super(key: key);

  final List<ExploreGuitar> guitars;
  int _current = 0;
  int items = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 110,
          width: 500,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/guitar_app_assets/topLogo.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        CarouselSlider(
          options: CarouselOptions(
              height: 250.0,
              autoPlay: true,
              aspectRatio: 1.0,
              onPageChanged: (index, i){
                _current = index;
                (context as Element).markNeedsBuild();
              }
          ),
          items: guitars.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return buildCard(i);
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: guitars.map((image) {
            items = guitars.indexOf(image);
            return Container(
                width: 20.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: _current == items
                        ? Colors.black87
                        : Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }

  Widget buildCard(ExploreGuitar guitars){
    if(guitars.cardType == GuitarsCardType.card1){
      return Card1(guitars: guitars);
    } else if(guitars.cardType == GuitarsCardType.card2){
      return Card2(guitars: guitars);
    } else if (guitars.cardType == GuitarsCardType.card3){
      return Card3(guitars: guitars);
    } else {
      throw Exception('This card doesn\'t exist!');
    }
  }
}