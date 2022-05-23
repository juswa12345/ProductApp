import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RankingControls extends StatefulWidget {
  const RankingControls({Key? key}) : super(key: key);

  @override
  State<RankingControls> createState() => _RankingControlsState();
}

class _RankingControlsState extends State<RankingControls> {
  List<String> images = [
    'assets/select_images/guitar_ybanez.jpg',
    'assets/select_images/guitar_strat.jpg',
    'assets/select_images/guitar_thinline.jpg'
  ];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 500,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/guitar_app_assets/container.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  child: const Text(
                    'TOP SALES',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: const Text(
                    'BEGINNERS',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      index = 2;
                    });
                  },
                  child: const Text(
                    'NEWS',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 125,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(
                        Icons.search_sharp,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 200,
          width: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(images[index]),
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}
