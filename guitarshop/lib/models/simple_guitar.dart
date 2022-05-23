import 'dart:ui';

class Guitars {
  String id;
  String guitarImage;
  String title;
  String type;
  String source;
  List<String> information;
  List<int> price;
  int reviews;
  String detailedInfo;

  Guitars({
    required this.id,
    required this.guitarImage,
    required this.title,
    required this.type,
    required this.source,
    required this.information,
    required this.price,
    required this.reviews,
    required this.detailedInfo,
  });

  factory Guitars.fromJson(Map<dynamic, dynamic> json) {
    return Guitars(
      id: json['id'] as String,
      guitarImage: json['guitarImage'] as String,
      title: json['title'] as String,
      type: json['type'] as String,
      source: json['source'] as String,
      information: json['information'].cast<String>() as List<String>,
      price: json['price'].cast<int>() as List<int>,
      reviews: json['reviews'] as int,
      detailedInfo: json['detailedInformation'] as String,
    );
  }
}
