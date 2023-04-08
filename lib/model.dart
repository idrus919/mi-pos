import 'package:mi_pos/services/utils.dart';

class Model {
  final int? id;
  final String? picture, pictureOri;
  final DateTime? createdAt;
  int? count;
  String? code, name, price;

  Model({
    this.id,
    this.code,
    this.name,
    this.picture,
    this.pictureOri,
    this.price,
    this.createdAt,
    this.count,
  });

  static Model? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    final price = (json['price'] ?? '').toString();

    return Model(
      id: json['id'],
      name: json['name'],
      code: json['food_code'],
      picture: json['picture'],
      pictureOri: json['picture_ori'],
      price: price.isEmpty ? '0' : price,
      createdAt: Utils.parseDate(json['created_at']),
    );
  }

  Map<String, dynamic> get toJson {
    return {
      'food_code': code,
      'name': name,
      'price': price,
    };
  }
}
