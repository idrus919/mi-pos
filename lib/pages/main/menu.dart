import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_pos/controllers/index.dart';
import 'package:mi_pos/themes.dart';
import 'package:mi_pos/widgets/loading.dart';
import 'package:mi_pos/widgets/menu.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MainController.find;
    return Obx(() {
      final loading = controller.loading.value;
      final menus = controller.menus.value ?? [];
      final list = menus.where((e) => (e?.name ?? '').isNotEmpty).toList();

      return CustomScrollView(
        slivers: [
          Builder(builder: (context) {
            if (loading) {
              return const SliverFillRemaining(
                child: Center(child: LoadingWidget()),
              );
            }

            return SliverToBoxAdapter(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: list.length,
                padding: inset(),
                shrinkWrap: true,
                clipBehavior: Clip.none,
                itemBuilder: (context, index) {
                  final menu = list[index];
                  return MenuWidget(menu: menu, onTap: () {});
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 150 / 250,
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
              ),
            );
          }),
        ],
      );
    });
  }
}
