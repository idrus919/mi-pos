import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_pos/models/menu.dart';
import 'package:mi_pos/services/utils.dart';
import 'package:mi_pos/themes.dart';
import 'package:mi_pos/widgets/image_network.dart';
import 'package:mi_pos/widgets/inkwell.dart';

class OrderWidget extends StatelessWidget {
  final MenuModel? order;
  final VoidCallback? add, sub;
  const OrderWidget({super.key, this.order, this.add, this.sub});

  @override
  Widget build(BuildContext context) {
    final price = order?.price ?? '0';
    final count = order?.count ?? 0;
    return Padding(
      padding: insetSymmetric(16, 12),
      child: Row(
        children: [
          ImageNetworkWidget(
            url: order?.picture,
            width: 48,
            height: 42,
            radius: borderRadius(5),
          ),
          width(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order?.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Get.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                height(4),
                RichText(
                  text: TextSpan(
                    style: Get.textTheme.bodySmall,
                    children: [
                      TextSpan(
                        text: 'Rp. ${Utils.currency(double.parse(price))}',
                        style: Get.textTheme.bodySmall?.copyWith(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const TextSpan(text: '/porsi'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(color: primaryColor),
              borderRadius: borderRadius(5),
            ),
            child: InkWellWidget(
              padding: insetSymmetric(12, 8),
              radius: borderRadius(5),
              onTap: sub,
              child: Text(
                '-',
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  height: 0.8,
                  color: primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 36,
            child: Center(
              child: Text(
                count.toString(),
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              border: Border.all(color: primaryColor),
              borderRadius: borderRadius(5),
            ),
            child: InkWellWidget(
              padding: insetSymmetric(12, 8),
              radius: borderRadius(5),
              onTap: add,
              child: Text(
                '+',
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  height: 0.8,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
