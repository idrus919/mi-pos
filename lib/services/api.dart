import 'package:flutter/material.dart';
import 'package:mi_pos/services/dio/index.dart';

class ApiService {
  static final dio = DioClient();

  static Future get(
    String url, {
    String? accessToken,
    required Function(dynamic value) onSuccess,
    required VoidCallback onError,
  }) async {
    try {
      final response = await dio.request.get(url);
      onSuccess(response.data);
    } catch (e) {
      onError();
    }
  }
}
