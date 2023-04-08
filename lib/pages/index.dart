import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_pos/controller.dart';
import 'package:mi_pos/pages/menu.dart';
import 'package:mi_pos/pages/order.dart';
import 'package:mi_pos/themes.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 78,
        title: Container(
          margin: insetLTRB(16, 0, 0, 0),
          decoration: BoxDecoration(
            border: Border.all(color: darkColor),
            borderRadius: borderRadius(50),
          ),
          child: TextFormField(
            style: Get.textTheme.bodyMedium?.copyWith(height: 1),
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              hintText: 'Cari menu',
              prefixIcon: Icon(Icons.search),
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              errorBorder: InputBorder.none,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: MainController.find.create,
            icon: const Icon(Icons.add_circle_outline, color: primaryColor),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: const [
            MenuSection(),
            Align(
              alignment: Alignment.bottomCenter,
              child: OrderSection(),
            ),
          ],
        ),
      ),
    );
  }
}
