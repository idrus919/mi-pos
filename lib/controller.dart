import 'package:get/get.dart';
import 'package:mi_pos/model.dart';
import 'package:mi_pos/pages/charge.dart';
import 'package:mi_pos/pages/create.dart';
import 'package:mi_pos/services/data.dart';

class MainController extends GetxController {
  static MainController get find => Get.find();

  final loading = false.obs;
  final menus = Rxn<List<Model?>>();
  final orders = <Model?>[].obs;
  final expand = false.obs;

  @override
  void onInit() {
    get();
    super.onInit();
  }

  Future get() async {
    loading.value = true;
    await DataService.getAll(
      onSuccess: (values) => menus.value = values,
    );
    loading.value = false;
  }

  void order(Model? menu) {
    final selecteds = orders.where((e) => e?.id == menu?.id).toList();
    if (selecteds.isNotEmpty) {
      final selected = selecteds.first;
      final count = (selected?.count ?? 0) + 1;
      selected?.count = count;
      final index = orders.indexWhere((e) => e?.id == menu?.id);
      orders[index] = selected;
    } else {
      menu?.count = 1;
      orders.add(menu);
    }
    orders.refresh();
  }

  void sub(Model? menu) {
    final selecteds = orders.where((e) => e?.id == menu?.id).toList();
    if (selecteds.isNotEmpty) {
      final selected = selecteds.first;
      final count = (selected?.count ?? 0) - 1;
      final index = orders.indexWhere((e) => e?.id == menu?.id);
      if (count > 0) {
        selected?.count = count;
        orders[index] = selected;
      } else {
        orders.removeAt(index);
      }
      orders.refresh();
    }
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

  void show() {
    expand.value = !expand.value;
  }

  void charge() {
    Get.bottomSheet(
      ChargePage(orders: orders),
      useRootNavigator: true,
      isScrollControlled: true,
    );
  }

  void create() async {
    final result = await Get.bottomSheet(
      const CreatePage(),
      useRootNavigator: true,
      isScrollControlled: true,
    );
    if (result != null) get();
  }
}
