import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:sizer/sizer.dart';

class StyleText {
  //Auth text style
  static TextStyle authTitle1 = TextStyle(
      fontFamily: Resources.font.primaryFont,
      fontWeight: FontWeight.w700,
      height: 0,
      color: Resources.color.titleColor,
      decoration: TextDecoration.none,
      fontSize: 23.sp);

  static TextStyle authTitle2 = TextStyle(
    decoration: TextDecoration.none,
    color: Resources.color.subtitleColor,
    fontSize: 12.sp,
    fontFamily: Resources.font.primaryFont,
    fontWeight: FontWeight.w500,
  );

  static TextStyle authSubtitle1 = TextStyle(
    decoration: TextDecoration.none,
    color: Resources.color.subtitleColor,
    fontSize: 12.sp,
    fontFamily: Resources.font.primaryFont,
    fontWeight: FontWeight.w500,
  );

  static TextStyle signInField = TextStyle(
      color: Resources.color.hintColor,
      fontSize: 10.sp,
      fontFamily: Resources.font.primaryFont,
      fontWeight: FontWeight.w500);

  static TextStyle authTextButton = TextStyle(
    decoration: TextDecoration.none,
    color: Resources.color.primaryColor,
    fontSize: 12.sp,
    fontFamily: Resources.font.primaryFont,
    fontWeight: FontWeight.w500,
  );

  static TextStyle authElevatedButton = TextStyle(
    decoration: TextDecoration.none,
    color: Resources.color.whiteColor,
    fontSize: 12.sp,
    fontFamily: Resources.font.primaryFont,
    fontWeight: FontWeight.w500,
  );

  static TextStyle signInSubtitle1 = TextStyle(
      decoration: TextDecoration.none,
      color: Resources.color.subtitleColor,
      fontSize: 12.sp,
      fontFamily: Resources.font.primaryFont,
      fontWeight: FontWeight.w400);

  static TextStyle signInSubtitle2 = TextStyle(
      decoration: TextDecoration.none,
      color: Resources.color.subtitleColor,
      fontSize: 12.sp,
      fontFamily: Resources.font.primaryFont,
      fontWeight: FontWeight.w700);

  // home text style
  static TextStyle homeGreeting1 = TextStyle(
    decoration: TextDecoration.none,
    color: Resources.color.subtitleColor,
    fontSize: 15.sp,
    fontFamily: Resources.font.primaryFont,
    fontWeight: FontWeight.w800,
  );

  static TextStyle homeGreeting2 = TextStyle(
    decoration: TextDecoration.none,
    color: Resources.color.subtitleColor,
    fontSize: 12.sp,
    fontFamily: Resources.font.primaryFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle homeGreeting3 = TextStyle(
    decoration: TextDecoration.none,
    overflow: TextOverflow.ellipsis,
    color: Resources.color.subtitleColor,
    fontSize: 12.sp,
    fontFamily: Resources.font.primaryFont,
    fontWeight: FontWeight.w600,
  );

  static TextStyle homeGreeting4 = TextStyle(
      decoration: TextDecoration.none,
      color: Resources.color.hintColor,
      fontSize: 12.sp,
      fontFamily: Resources.font.primaryFont,
      fontWeight: FontWeight.w500);

  //Video Card text style
  static TextStyle cardTitle1 = TextStyle(
    decoration: TextDecoration.none,
    overflow: TextOverflow.ellipsis,
    color: Resources.color.subtitleColor,
    fontSize: 12.sp,
    fontFamily: Resources.font.primaryFont,
    fontWeight: FontWeight.w700,
  );

  static TextStyle cardSubTitle1 = TextStyle(
    decoration: TextDecoration.none,
    color: Resources.color.hintColor,
    fontSize: 10.sp,
    fontFamily: Resources.font.primaryFont,
    fontWeight: FontWeight.w400,
  );
}
