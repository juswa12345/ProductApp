import 'dart:ui';

enum Variation{
  vintage,
  classic,
  modern,
}

class GuitarItem{
  final String id;
  late final String name;
  final Variation variation;
  final Color color;
  final int quantity;
  final int totalPrice;
  final DateTime date;
  final String path;
  final bool isComplete;


  GuitarItem({
    required this.id,
    required this.name,
    required this.variation,
    required this.color,
    required this.quantity,
    required this.totalPrice,
    required this.date,
    required this.path,
    this.isComplete = false,
  });

  GuitarItem copyWith({
    String? id,
    String? name,
    Variation? variation,
    Color? color,
    int? quantity,
    int? totalPrice,
    DateTime? date,
    String? path,
    bool? isComplete,
  }){
    return GuitarItem(
      id: id ?? this.id,
      name: name ?? this.name,
      variation: variation ?? this.variation,
      color: color ?? this.color,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      date: date ?? this.date,
      path: path ?? this.path,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}