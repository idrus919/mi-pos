import 'package:intl/intl.dart';

class Utils {
  static DateTime? parseDate(String? text) {
    text = text ?? '';
    if (text.isEmpty) return null;

    return DateTime.parse(text);
  }

  static String currency(double? idr, {bool isNegative = false}) {
    if (idr != null) {
      final currency = NumberFormat("###,###.###", "ID").format(idr);
      return '${isNegative ? "-" : ""}$currency';
    }
    return '';
  }

  static bool isList(dynamic data) {
    if (data == null) return false;
    return (data as List?) != null && (data as List).isNotEmpty;
  }
}
