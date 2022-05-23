import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guitarshop/models/models.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:guitarshop/screens/shop_items_screen.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:guitarshop/components/guitar_tile.dart';
import 'package:provider/provider.dart';

class GuitarDetailsScreen extends StatefulWidget {
  final String srcImage;
  final String name;
  final String type;
  final String source;
  final List<String> information;
  final int reviews;
  final List<int> prices;
  final String detailedInfo;

  const GuitarDetailsScreen({
    Key? key,
    required this.srcImage,
    required this.name,
    required this.type,
    required this.source,
    required this.information,
    required this.reviews,
    required this.detailedInfo,
    required this.prices,
  }) : super(key: key);

  @override
  State<GuitarDetailsScreen> createState() => _GuitarDetailsScreenState();
}

class _GuitarDetailsScreenState extends State<GuitarDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Colors.black45,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 5,
            width: 300,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Image.asset(
            widget.srcImage,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            height: 5,
            width: 300,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              const Text(
                'Reviews:',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              buildStars(widget.reviews),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                '${widget.reviews}.0',
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            height: 5,
            width: 300,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Flex(
              direction: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            widget.information[index],
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 0,
                          );
                        },
                        itemCount: widget.information.length,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 3.0,
                        width: 400.0,
                        child: Container(color: Colors.black87),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        widget.detailedInfo,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStars(int rate) {
    return Row(children: [
      for (int i = 0; i < 5; i++)
        (i < rate)
            ? const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20,
              )
            : const Icon(
                Icons.star,
                color: Colors.grey,
                size: 20,
              ),
    ]);
  }
}
