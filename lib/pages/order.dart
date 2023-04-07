// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_pos/controller.dart';
import 'package:mi_pos/services/utils.dart';
import 'package:mi_pos/themes.dart';
import 'package:mi_pos/widgets/inkwell.dart';
import 'package:mi_pos/widgets/order.dart';

class OrderSection extends StatelessWidget {
  const OrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedContainer(
          color: whiteColor,
          duration: const Duration(milliseconds: 500),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildCharge,
              Flexible(child: _buildList),
            ],
          ),
        ),
        _buildButtonTop,
      ],
    );
  }

  Widget get _buildCharge {
    final controller = MainController.find;
    return Obx(() {
      final total = double.parse('${controller.totalCharge}');
      return Container(
        padding: inset(),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: primaryColor),
          ),
        ),
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  color: primaryColor.withOpacity(0.5),
                ),
                Positioned(
                  top: -2,
                  right: -4,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: redColor,
                    ),
                    child: Center(
                      child: Text(
                        '${controller.totalCount}',
                        style: Get.textTheme.bodySmall?.copyWith(
                          color: whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            width(12),
            Expanded(
              child: Text(
                'Rp. ${Utils.currency(total)}',
                style: Get.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Charge'),
            ),
          ],
        ),
      );
    });
  }

  Widget get _buildButtonTop {
    return Positioned(
      top: -16,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor,
            ),
            child: InkWellWidget(
              onTap: MainController.find.show,
              radius: borderRadius(50),
              padding: inset(8),
              child: const Icon(
                Icons.keyboard_arrow_up_outlined,
                color: whiteColor,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _buildList {
    final controller = MainController.find;
    return Obx(() {
      final orders = controller.orders.value;
      final expand = controller.expand.value;

      if (!expand) return height(0);

      return ListView.separated(
        shrinkWrap: true,
        padding: inset(0),
        itemBuilder: (context, index) {
          final order = orders[index];
          return OrderWidget(
            order: order,
            add: () => controller.order(order),
            sub: () => controller.sub(order),
          );
        },
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemCount: orders.length,
      );
    });
  }
}
