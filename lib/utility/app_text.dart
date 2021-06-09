import 'package:Decor8/resources/app_colors.dart';
import 'package:Decor8/resources/app_fonts.dart';
import 'package:Decor8/resources/dimen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_text_style.dart';

class AppText {
  static String capitalize(String text) {
    if (text?.isNotEmpty == true) {
      return text
          .split(" ")
          .map((s) => s[0].toUpperCase() + s.substring(1))
          .join(" ");
    } else {
      return "";
    }
  }

  static Widget titleField(
      {String title,
      String subtitle,
      BuildContext context,
      bool showBackButton = false,
      Color color}) {
    return Row(
      children: <Widget>[
        Visibility(
          visible: showBackButton,
          child: GestureDetector(
            onTap: () {
              if (context != null) {
                Navigator.of(context).pop();
              }
            },
            child: Padding(
              padding: EdgeInsets.only(right: Dimen.BASE_MARGIN),
              child: Icon(
                Icons.arrow_back,
                color: color ?? AppColors.primaryColor,
                size: 22,
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              titleText(title, color: color),
              Padding(
                padding: const EdgeInsets.only(top: Dimen.TINY),
                child: smallBold(subtitle, color: color),
              )
            ],
          ),
        ),
      ],
    );
  }

  static Widget titleText(String text, {Color color}) {
    return Text(
      text ?? "",
      maxLines: 1,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontFamily: AppFonts.poppinsMedium,
          fontStyle: FontStyle.normal,
          color: color ?? AppColors.textDarkGrayColor,
          fontSize: TextSize.title,
          fontWeight: FontWeight.w600),
    );
  }

  static Widget small(String text, {Color color}) {
    return Text(
      text ?? "",
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      softWrap: true,
      style: AppTextStyle.small(color: color),
    );
  }

  static Widget smallMultiLine(String text, {Color color}) {
    return Text(
      text ?? "",
      softWrap: true,
      style: AppTextStyle.small(color: color),
    );
  }

  static Widget smallMultiLineCenterAlign(String text, {Color color}) {
    return Text(
      text ?? "",
      textAlign: TextAlign.center,
      softWrap: true,
      style: AppTextStyle.small(color: color),
    );
  }

  static Widget smallBold(String text,
      {Color color, Color backgroundColor, bool isMultiline = false}) {
    return Text(
      text ?? "",
      overflow: TextOverflow.ellipsis,
      maxLines: isMultiline ? 10 : 1,
      softWrap: true,
      style: AppTextStyle.smallBold(
          color: color, backgroundColor: backgroundColor),
    );
  }

  static Widget normal(String text, {Color color}) {
    return Text(
      text ?? "",
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      softWrap: true,
      style: AppTextStyle.normal(color: color),
    );
  }

  static Widget normalBold(String text,
      {Color color, bool isUnderline = false}) {
    return Text(
      text ?? "",
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      softWrap: true,
      style: AppTextStyle.normalBold(color: color, isUnderline: isUnderline),
    );
  }

  static Widget medium(String text,
      {Color color, Color backgroundColor, TextAlign alignment}) {
    return Text(
      text ?? "",
      maxLines: 1,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      textAlign: alignment,
      style:
          AppTextStyle.medium(color: color, backgroundColor: backgroundColor),
    );
  }

  static Widget mediumBold(String text, {Color color}) {
    return Text(
      text ?? "",
      maxLines: 1,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyle.mediumBold(color: color),
    );
  }

  static Widget largeBold(String text, {Color color}) {
    return Text(text,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        softWrap: true,
        style: AppTextStyle.largeBold(color: color));
  }

  static Widget extraLarge(String text, {Color color}) {
    return Text(text,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        softWrap: true,
        style: AppTextStyle.extraLarge(color: color));
  }

  static Widget extraLargeBold(String text, {Color color}) {
    return Text(text,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        softWrap: true,
        style: AppTextStyle.extraLargeBold(color: color));
  }
}
