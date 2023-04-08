import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_pos/model.dart';
import 'package:mi_pos/services/utils.dart';
import 'package:mi_pos/themes.dart';
import 'package:mi_pos/widgets/image_network.dart';

class MenuWidget extends StatelessWidget {
  final Model? menu;
  final VoidCallback? onTap;
  const MenuWidget({super.key, this.menu, this.onTap});

  @override
  Widget build(BuildContext context) {
    final price = menu?.price ?? '0';
    debugPrint(price);
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: borderRadius(5),
        boxShadow: [
          BoxShadow(
            color: darkColor.withOpacity(0.05),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: ImageNetworkWidget(
              url: menu?.picture,
              radius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: inset(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      menu?.name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Get.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
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
                  height(8),
                  ElevatedButton(
                    onPressed: onTap,
                    child: const Center(child: Text('Order')),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
