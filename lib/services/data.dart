import 'package:mi_pos/models/menu.dart';
import 'package:mi_pos/services/api.dart';
import 'package:mi_pos/services/utils.dart';

class DataService {
  static Future menus({
    required Function(List<MenuModel?>? values) onSuccess,
  }) async {
    const url = '';

    await ApiService.get(
      url,
      onSuccess: (json) {
        List<MenuModel?> result = [];
        if (Utils.isList(json)) {
          final data = json as List;
          result = data.map((f) => MenuModel.fromJson(f)).toList();
        }
        onSuccess(result);
      },
      onError: () {},
    );
  }
}
