import 'package:get/get.dart';
import 'package:mi_pos/models/menu.dart';
import 'package:mi_pos/services/data.dart';

class MainController extends GetxController {
  static MainController get find => Get.find();

  final loading = false.obs;
  final menus = Rxn<List<MenuModel?>>();
  final orders = <MenuModel?>[].obs;

  @override
  void onInit() {
    get();
    super.onInit();
  }

  Future get() async {
    loading.value = true;
    await DataService.menus(
      onSuccess: (values) => menus.value = values,
    );
    loading.value = false;
  }

  void order(MenuModel? menu) {
    final selecteds = orders.where((e) => e?.id == menu?.id).toList();
    if (selecteds.isNotEmpty) {
      final selected = selecteds.first;
      final count = selected?.count ?? 0;
      selected?.count = count + 1;
      final index = orders.indexWhere((e) => e?.id == menu?.id);
      orders[index] = selected;
    } else {
      menu?.count = 1;
      orders.add(menu);
    }
    orders.refresh();
  }

  int get totalCharge {
    if (orders.isEmpty) return 0;

    final totals = orders.map((e) {
      final count = e?.count ?? 0;
      final price = e?.price ?? '0';
      final priceInt = int.tryParse(price) ?? 0;
      final total = count * priceInt;
      return total;
    }).toList();
    return totals.reduce((a, b) => a + b);
  }

  int get totalCount {
    if (orders.isEmpty) return 0;

    final counts = orders.map((e) => e?.count ?? 0).toList();
    return counts.reduce((a, b) => a + b);
  }
}
