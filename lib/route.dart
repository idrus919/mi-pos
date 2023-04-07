import 'package:get/get.dart';
import 'package:mi_pos/pages/main/index.dart';

abstract class Paths {
  static const main = '/';
}

abstract class Routes {
  static const main = Paths.main;
}

class AppRoutes {
  static final routes = [
    GetPage(
      name: Paths.main,
      page: () => const MainPage(),
    ),
  ];
}
