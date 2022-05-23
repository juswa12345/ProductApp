import 'package:guitarshop/components/guitar_tumbnail.dart';
import 'package:flutter/material.dart';

import 'package:guitarshop/components/components.dart';
import 'package:guitarshop/models/models.dart';

class GuitarsGridView extends StatelessWidget {
  final List<Guitars> guitars;
  const GuitarsGridView({Key? key, required this.guitars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: guitars.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (context, index) {
          final sampleGuitar = guitars[index];
          return GuitarThumbnail(guitars: sampleGuitar);
        },
      ),
    );
  }
}
