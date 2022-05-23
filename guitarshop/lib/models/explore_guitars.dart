
class GuitarsCardType {
  static const card1 = 'card1';
  static const card2 = 'card2';
  static const card3 = 'card3';
}

class ExploreGuitar {
  String id;
  String cardType;

  ExploreGuitar({
    required this.id,
    required this.cardType,
  });

  factory ExploreGuitar.fromJson(Map<String, dynamic> json) {
    return ExploreGuitar(
      id: json['id'] as String,
      cardType: json['cardType'] as String,
    );
  }
}
