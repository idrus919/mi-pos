import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_pos/themes.dart';
import 'package:mi_pos/widgets/loading.dart';

class ImageNetworkWidget extends StatelessWidget {
  final String? url;
  final double? width, height;
  final BorderRadiusGeometry? radius;
  const ImageNetworkWidget({
    Key? key,
    this.url,
    this.width,
    this.height,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? borderRadius(0),
      child: CachedNetworkImage(
        imageUrl: url ?? '',
        width: width,
        height: height,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (_, __, ___) {
          return const Center(child: LoadingWidget());
        },
        errorWidget: (_, __, ___) {
          return Center(
            child: Text('no image', style: Get.textTheme.bodySmall),
          );
        },
      ),
    );
  }
}
