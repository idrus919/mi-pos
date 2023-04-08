import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_pos/services/dio/index.dart';

class ApiService {
  static final dio = DioClient();

  static Future get({
    required Function(dynamic value) onSuccess,
  }) async {
    try {
      final response = await dio.request.get('');
      onSuccess(response.data);
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          message: e.toString(),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  static Future post({
    required Map<String, dynamic> body,
    required VoidCallback onSuccess,
  }) async {
    try {
      await dio.request.post('', data: jsonEncode(body));
      onSuccess();
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          message: e.toString(),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
