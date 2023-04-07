import 'package:flutter/material.dart';
import 'package:mi_pos/themes.dart';

class LoadingWidget extends StatelessWidget {
  final double? size;
  final Color? color;
  const LoadingWidget({Key? key, this.size, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? defaultSize,
      height: size ?? defaultSize,
      child: CircularProgressIndicator(
        strokeWidth: 3,
        color: color ?? darkColor,
      ),
    );
  }
}
