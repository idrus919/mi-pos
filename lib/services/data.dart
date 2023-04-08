import 'package:flutter/material.dart';
import 'package:mi_pos/model.dart';
import 'package:mi_pos/services/api.dart';
import 'package:mi_pos/services/utils.dart';

class DataService {
  static Future getAll({
    required Function(List<Model?>? values) onSuccess,
  }) async {
    await ApiService.get(
      onSuccess: (json) {
        List<Model?> result = [];
        if (Utils.isList(json)) {
          final data = json as List;
          result = data.map((f) => Model.fromJson(f)).toList();
        }
        onSuccess(result);
      },
    );
  }

  static Future create({
    required Model input,
    required VoidCallback onSuccess,
  }) async {
    await ApiService.post(
      body: input.toJson,
      onSuccess: onSuccess,
    );
  }
}
