import 'package:mi_pos/services/utils.dart';

class MenuModel {
  final int? id;
  final String? code, name, picture, pictureOri, price;
  final DateTime? createdAt;
  int? count;

  MenuModel({
    this.id,
    this.code,
    this.name,
    this.picture,
    this.pictureOri,
    this.price,
    this.createdAt,
    this.count,
  });

  static MenuModel? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return MenuModel(
      id: json['id'],
      name: json['name'],
      code: json['food_code'],
      picture: json['picture'],
      pictureOri: json['picture_ori'],
      price: json['price'],
      createdAt: Utils.parseDate(json['created_at']),
    );
  }
}
