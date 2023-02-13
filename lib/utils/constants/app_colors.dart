import 'package:flutter/material.dart';

class AppColors {
  static final AppColors _singleton = AppColors._internal();

  factory AppColors() {
    return _singleton;
  }

  AppColors._internal();

  Color get black => Colors.black;

  Color get white => Colors.white;

  Color get primary => const Color(0xffD91120);

  Color get textColor => const Color(0xff333333);

  Color get facebook => const Color(0xFF3A5999);

  Color get blue => const Color(0xFF23B1E5);

  Color get star => const Color(0xFFF8B81B);

  Color get yellow => const Color(0xFFF8B81B);

  Color get green => const Color(0xFF78AC30);

  Color get grey => const Color(0xff9B9B9B);

  Color get borderColor => const Color(0xffEFEFEF);

  Color get point1 => const Color(0xffF7A71E);

  Color get point2 => const Color(0xffEBD94F);
  Color get red => const Color(0xffFF8989);
  Color get otherGrey => const Color(0xffB4B4B4);
}
