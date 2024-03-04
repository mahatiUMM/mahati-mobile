import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/utils/Colors/color_app.dart';
import 'package:sizer/sizer.dart';

class StyleText {
  //Auth text style
  static TextStyle authTitle1 = TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      height: 0,
      color: ColorApp.titleColor,
      decoration: TextDecoration.none,
      fontSize: 23.sp);

  static TextStyle authTitle2 = TextStyle(
    decoration: TextDecoration.none,
    color: ColorApp.subTitleColor,
    fontSize: 12.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );

  static TextStyle authSubtitle1 = TextStyle(
    decoration: TextDecoration.none,
    color: ColorApp.subTitleColor,
    fontSize: 12.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );

  static TextStyle signInField = TextStyle(
      color: ColorApp.hintColor,
      fontSize: 10.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500);

  static TextStyle authTextButton = TextStyle(
    decoration: TextDecoration.none,
    color: ColorApp.primaryColor,
    fontSize: 12.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );

  static TextStyle authElevatedButton = TextStyle(
    decoration: TextDecoration.none,
    color: ColorApp.backgroundColor,
    fontSize: 12.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );

  static TextStyle signInSubtitle1 = TextStyle(
      decoration: TextDecoration.none,
      color: ColorApp.subTitleColor,
      fontSize: 12.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400);

  static TextStyle signInSubtitle2 = TextStyle(
      decoration: TextDecoration.none,
      color: ColorApp.subTitleColor,
      fontSize: 12.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700);
}
