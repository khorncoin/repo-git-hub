import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppFontStyle {
  static final AppFontStyle _singleton = AppFontStyle._internal();

  factory AppFontStyle() {
    return _singleton;
  }

  AppFontStyle._internal();

  TextStyle titleL(
      {double fontSize = 20,
      Color color = Colors.black,
      double lineHeight = 0,
      FontWeight fontWeight = FontWeight.bold,
      String fontFamily = "",
      TextDecoration? textDecoration}) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
      decoration: textDecoration,
      height: lineHeight.px,
    );
  }

  TextStyle titleM(
      {double fontSize = 18,
      Color color = Colors.black,
      double lineHeight = 0,
      FontWeight fontWeight = FontWeight.bold,
      String fontFamily = "",
      TextDecoration? textDecoration}) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
      decoration: textDecoration,
      height: lineHeight.sp,
    );
  }

  TextStyle titleS(
      {double fontSize = 16,
      Color color = Colors.black,
      double lineHeight = 0,
      FontWeight fontWeight = FontWeight.bold,
      String fontFamily = "",
      TextDecoration? textDecoration}) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
      decoration: textDecoration,
      height: lineHeight.sp,
    );
  }

  TextStyle textL(
      {double fontSize = 18,
      Color color = Colors.black,
      double lineHeight = 0,
      FontWeight fontWeight = FontWeight.normal,
      String fontFamily = "",
      TextDecoration? textDecoration}) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
      decoration: textDecoration,
      height: lineHeight.sp,
    );
  }

  TextStyle textM(
      {double fontSize = 16,
      Color color = Colors.black,
      double lineHeight = 0,
      FontWeight fontWeight = FontWeight.normal,
      String fontFamily = "",
      TextDecoration? textDecoration}) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
      decoration: textDecoration,
      height: lineHeight.sp,
    );
  }

  TextStyle textS(
      {double fontSize = 14,
      Color color = Colors.black,
      double lineHeight = 0,
      FontWeight fontWeight = FontWeight.normal,
      String fontFamily = "",
      TextDecoration? textDecoration}) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
      decoration: textDecoration,
      height: lineHeight.sp,
    );
  }
}
