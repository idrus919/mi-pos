import 'package:flutter/material.dart';
import 'package:get/get.dart';

final themeData = ThemeData(
  primaryColor: primaryColor,
  appBarTheme: appBarTheme,
  fontFamily: 'Plus Jakarta Sans',
  scaffoldBackgroundColor: backgroundColor,
  textTheme: textTheme,
  backgroundColor: backgroundColor,
  elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyle),
);

const primaryColor = Color(0XFF445cda);
const backgroundColor = Color(0XFFf5f5f2);
const whiteColor = Color(0XFFFFFFFF);
const darkColor = Color(0XFF333333);
const redColor = Colors.red;
const greyColor = Colors.grey;

AppBarTheme appBarTheme = AppBarTheme(
  color: backgroundColor,
  iconTheme: const IconThemeData(color: darkColor),
  elevation: 0,
  toolbarHeight: 56,
  centerTitle: true,
  titleTextStyle: Get.textTheme.bodyText2?.copyWith(
    color: darkColor,
    fontWeight: FontWeight.w600,
  ),
);

TextTheme textTheme = const TextTheme(
  bodySmall: TextStyle(
    color: darkColor,
    fontSize: 12,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w400,
  ),
  bodyMedium: TextStyle(
    color: darkColor,
    fontSize: 14,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w400,
  ),
  bodyLarge: TextStyle(
    color: darkColor,
    fontSize: 16,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w400,
  ),
);

double get defaultSize => 16;

EdgeInsets inset([double? size]) {
  return EdgeInsets.all(size ?? defaultSize);
}

EdgeInsets insetHorizontal([double? size]) {
  return EdgeInsets.symmetric(horizontal: size ?? defaultSize);
}

EdgeInsets insetSymmetric(double horizontal, double vertical) {
  return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
}

EdgeInsets insetVertical([double? size]) {
  return EdgeInsets.symmetric(vertical: size ?? defaultSize);
}

EdgeInsets insetLTRB(double? left, double? top, double? right, double? bottom) {
  return EdgeInsets.fromLTRB(left ?? 0, top ?? 0, right ?? 0, bottom ?? 0);
}

BorderRadius borderRadius([double? radius]) {
  return BorderRadius.circular(radius ?? defaultSize);
}

SizedBox height([double? size]) {
  return SizedBox(height: size ?? defaultSize);
}

SizedBox width([double? size]) {
  return SizedBox(width: size ?? defaultSize);
}

ButtonStyle get elevatedButtonStyle {
  return ElevatedButton.styleFrom(
    padding: insetSymmetric(16, 10),
    backgroundColor: primaryColor,
    foregroundColor: whiteColor,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    shape: RoundedRectangleBorder(
      borderRadius: borderRadius(5),
    ),
    elevation: 0,
    minimumSize: Size.zero,
    shadowColor: Colors.transparent,
  );
}

InputDecoration get inputDecorationBorder {
  return const InputDecoration(
    isDense: true,
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: greyColor, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: greyColor, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: primaryColor, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: redColor, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: redColor, width: 1),
    ),
  );
}
