import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_pos/models/menu.dart';
import 'package:mi_pos/services/utils.dart';
import 'package:mi_pos/themes.dart';
import 'package:mi_pos/widgets/image_network.dart';

class MenuWidget extends StatelessWidget {
  final MenuModel? menu;
  final VoidCallback? onTap;
  const MenuWidget({super.key, this.menu, this.onTap});

  @override
  Widget build(BuildContext context) {
    final price = menu?.price ?? '0';
    return ClipRRect(
      borderRadius: borderRadius(5),
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: borderRadius(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ImageNetworkWidget(
                url: menu?.picture,
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
                        style: Get.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
