import 'package:get/get.dart';
import 'package:mi_pos/models/menu.dart';
import 'package:mi_pos/services/data.dart';

class MainController extends GetxController {
  static MainController get find => Get.find();

  final loading = false.obs;
  final menus = Rxn<List<MenuModel?>>();

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
}
