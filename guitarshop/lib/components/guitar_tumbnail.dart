import 'package:flutter/material.dart';
import 'package:guitarshop/models/models.dart';
import 'package:guitarshop/screens/guitar_details_screen.dart';

class GuitarThumbnail extends StatelessWidget {
  final Guitars guitars;
  const GuitarThumbnail({Key? key, required this.guitars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              child: InkWell(
                child: Image.asset(
                  guitars.guitarImage,
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GuitarDetailsScreen(
                        srcImage: guitars.guitarImage,
                        name: guitars.title,
                        type: guitars.type,
                        source: guitars.source,
                        information: guitars.information,
                        reviews: guitars.reviews,
                        prices: guitars.price,
                        detailedInfo: guitars.detailedInfo,
                      ),
                    ),
                  );
                },
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            guitars.title,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Type: ${guitars.type}',
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          Row(
            children: [
              Text(
                'Reviews: ${guitars.reviews.toString()}.0',
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 15,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
