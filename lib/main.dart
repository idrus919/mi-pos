import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mi_pos/controller.dart';
import 'package:mi_pos/route.dart';
import 'package:mi_pos/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      title: 'MI POS',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.main,
      getPages: AppRoutes.routes,
      initialBinding: BindingsBuilder(
        () => {Get.put(MainController(), permanent: true)},
      ),
      theme: themeData,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child ?? const SizedBox(),
        );
      },
    );
  }
}
