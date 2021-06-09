import 'package:Decor8/resources/app_colors.dart';
import 'package:Decor8/resources/app_fonts.dart';
import 'package:Decor8/resources/dimen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle small({Color color}) {
    return TextStyle(
      color: color ?? AppColors.textDarkGrayColor,
      fontSize: TextSize.SMALL,
      fontStyle: FontStyle.normal,
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle smallBold({Color color, Color backgroundColor}) {
    return TextStyle(
        color: color ?? AppColors.textDarkGrayColor,
        fontSize: TextSize.SMALL,
        fontStyle: FontStyle.normal,
        fontFamily: AppFonts.poppins,
        fontWeight: FontWeight.bold,
        backgroundColor: backgroundColor ?? Colors.transparent);
  }

  static TextStyle normal({Color color, double height}) {
    return TextStyle(
        color: color ?? AppColors.textDarkGrayColor,
        fontSize: TextSize.MEDIUM,
        fontStyle: FontStyle.normal,
        fontFamily: AppFonts.poppins,
        height: height,
        fontWeight: FontWeight.normal);
  }

  static TextStyle normalBold({Color color, bool isUnderline = false}) {
    return TextStyle(
        color: color ?? AppColors.textDarkGrayColor,
        fontSize: TextSize.MEDIUM,
        fontStyle: FontStyle.normal,
        fontFamily: AppFonts.poppins,
        fontWeight: FontWeight.bold,
        decoration: isUnderline ? TextDecoration.underline : null);
  }

  static TextStyle medium({Color color, Color backgroundColor}) {
    return TextStyle(
        color: color ?? AppColors.textDarkGrayColor,
        fontSize: TextSize.LARGE,
        fontStyle: FontStyle.normal,
        fontFamily: AppFonts.poppins,
        fontWeight: FontWeight.normal,
        backgroundColor: backgroundColor ?? Colors.transparent);
  }

  static TextStyle mediumBold({Color color}) {
    return TextStyle(
        decoration: TextDecoration.none,
        color: color ?? AppColors.textDarkGrayColor,
        fontSize: TextSize.LARGE,
        fontStyle: FontStyle.normal,
        fontFamily: AppFonts.poppins,
        fontWeight: FontWeight.bold);
  }

  static TextStyle largeBold({Color color}) {
    return TextStyle(
      color: color ?? AppColors.primaryColor,
      fontSize: TextSize.XX_LARGE,
      fontStyle: FontStyle.normal,
      fontFamily: AppFonts.poppinsBold,
    );
  }

  static TextStyle large({Color color, double height}) {
    return TextStyle(
      color: color ?? AppColors.primaryColor,
      fontSize: TextSize.LARGE,
      fontStyle: FontStyle.normal,
      height: height,
      fontFamily: AppFonts.poppins,
    );
  }

  static TextStyle extraLarge({Color color}) {
    return TextStyle(
      decoration: TextDecoration.none,
      color: color ?? AppColors.primaryColor,
      fontSize: TextSize.XXX_LARGE,
      fontStyle: FontStyle.normal,
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle extraLargeBold({Color color}) {
    return TextStyle(
      color: color ?? AppColors.primaryColor,
      fontSize: TextSize.XXXX_LARGE,
      fontStyle: FontStyle.normal,
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.bold,
    );
  }
}
