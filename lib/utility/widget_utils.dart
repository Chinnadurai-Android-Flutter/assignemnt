import 'dart:math';

import 'package:Decor8/data/country_model.dart';
import 'package:Decor8/data/recent_transaction_model.dart';
import 'package:Decor8/resources/app_colors.dart';
import 'package:Decor8/resources/app_strings.dart';
import 'package:Decor8/resources/dimen.dart';
import 'package:Decor8/resources/drawables.dart';
import 'package:Decor8/ui/countryDetails/country_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app_text_style.dart';

class WidgetUtils {
  Widget listViewItem(Country country) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimen.VERY_SMALL, vertical: Dimen.VERY_SMALL),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                imageField(country.flag),
                SizedBox(width: Dimen.UPPER_MEDIUM),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          country.symbol,
                          maxLines: 1,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style:
                              AppTextStyle.small(color: AppColors.borderGray),
                        ),
                        SizedBox(
                          width: Dimen.SMALL,
                        ),
                        Text(
                          '12000',
                          maxLines: 1,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.smallBold(
                              color: AppColors.blackColor),
                        ),
                      ],
                    ),
                    Text(
                      country.currencyCode,
                      maxLines: 1,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.small(color: AppColors.borderGray),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Text(
                  AppStrings.manage,
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.small(color: AppColors.borderGray),
                ),
                SizedBox(width: Dimen.TINY),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.primaryColor,
                  size: 15,
                ),
                SizedBox(width: Dimen.ULTRA_SMALL),
              ],
            )
          ],
        ));
  }

  Widget recentViewItem(RecentTransaction recentTransaction) {
    Random random = new Random();
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(Dimen.MEDIUM),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: Dimen.MEDIUM, top: Dimen.MEDIUM, bottom: Dimen.MEDIUM),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  child: Container(
                    decoration: BoxDecoration(
                        // color: AppColors.appBlueColor,
                        color: AppStrings.colors[random.nextInt(4)],
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    padding: EdgeInsets.all(Dimen.ULTRA_SMALL),
                    child: Icon(
                      recentTransaction.imagePath,
                      color: AppColors.textweight,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(width: Dimen.UPPER_MEDIUM),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recentTransaction.companyName,
                      maxLines: 1,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style:
                          AppTextStyle.smallBold(color: AppColors.blackColor),
                    ),
                    SizedBox(
                      height: Dimen.TINY,
                    ),
                    Row(
                      children: [
                        Text(
                          recentTransaction.time,
                          maxLines: 1,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style:
                              AppTextStyle.small(color: AppColors.borderGray),
                        ),
                        SizedBox(
                          width: Dimen.TINY,
                        ),
                        Container(
                          color: AppColors.borderGray,
                          height: 2,
                          width: 2,
                        ),
                        SizedBox(
                          width: Dimen.TINY,
                        ),
                        Text(
                          recentTransaction.date,
                          maxLines: 1,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style:
                              AppTextStyle.small(color: AppColors.borderGray),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                Text(
                  '\$' + recentTransaction.price,
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.smallBold(color: AppColors.blackColor),
                ),
                SizedBox(width: Dimen.TINY),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.borderGray,
                  size: 15,
                ),
                SizedBox(width: Dimen.ULTRA_SMALL),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget imageField(String imageURL) {
    Random random = new Random();
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(500.0),
          child: SvgPicture.network(
            imageURL,
            placeholderBuilder: (BuildContext context) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(Drawables.logo),
                  fit: BoxFit.fill,
                ),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.all(30.0),
              child: placeHolder(true),
              height: 60,
              width: 50,
            ),
          ),
        ),
      ),
    );
  }

  static Widget placeHolder(isPlaceHolder) {
    return Center(
      child: Visibility(
        visible: isPlaceHolder,
        child: CircularProgressIndicator(
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }

  Widget listViewHeaderView(
      BuildContext context, Color backgroundColor, bool isIcon, String leading,
      {String trailing, String iconImage}) {
    return MediaQuery.removePadding(
        context: context,
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimen.MEDIUM),
              topRight: Radius.circular(Dimen.MEDIUM),
            ),
          ),
          child: headerBodyView(context, true, leading,
              iconImage: Drawables.visa, trailing: trailing),
        ));
  }

  Widget headerBodyView(BuildContext context, bool isIcon, String leading,
      {String trailing, String iconImage}) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimen.UPPER_MEDIUM,
          top: Dimen.UPPER_MEDIUM,
          right: Dimen.MEDIUM),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leading ?? "",
            textAlign: TextAlign.center,
            style: AppTextStyle.small(color: AppColors.blackColor),
          ),
          isIcon
              ? Image.asset(
                  iconImage,
                  width: Dimen.X_LARGE,
                  height: Dimen.X_LARGE,
                )
              : Row(
                  children: [
                    GestureDetector(
                      child: Text(
                        trailing ?? '',
                        maxLines: 1,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style:
                            AppTextStyle.smallBold(color: AppColors.blackColor),
                      ),
                      onTap: () {
                        navigation(CountryScreen(), context);
                      },
                    ),
                    SizedBox(width: Dimen.TINY),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: AppColors.primaryColor,
                      size: 15,
                    ),
                    SizedBox(width: Dimen.ULTRA_SMALL),
                  ],
                ),
        ],
      ),
    );
  }

  void navigation(StatefulWidget statefulWidget, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => statefulWidget,
      ),
    );
  }

  Widget atmLocatorView(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(
          left: Dimen.UPPER_MEDIUM,
          top: Dimen.UPPER_MEDIUM,
          right: Dimen.MEDIUM),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Dimen.MEDIUM),
          ),
        ),
        child: MediaQuery.removePadding(
          removeBottom: true,
          context: context,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Dimen.VERY_SMALL,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.atmLocatorString,
                    maxLines: 1,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.mediumBold(color: AppColors.blackColor),
                  ),
                  SizedBox(
                    height: Dimen.VERY_SMALL,
                  ),
                  Text(
                    AppStrings.atmLocatorContentString,
                    maxLines: 1,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.small(color: AppColors.blackColor),
                  ),
                  SizedBox(
                    height: Dimen.VERY_SMALL,
                  ),
                  button(AppStrings.startLooking,
                      textColor: AppColors.textweight,
                      backgroundColor: AppColors.appPrimaryBlue),
                ],
              ),
              Image.asset(
                Drawables.atm_locator,
                width: 170,
                height: 140,
                fit: BoxFit.fill,
              )
            ],
          ),
        ),
      ),
    );
  }

  static void showSnackBar(BuildContext context, String message) {
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }

  static Widget errorWidget(String text) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            Drawables.logo,
            width: 220,
            height: 220,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: Dimen.BASE_MARGIN,
                right: Dimen.BASE_MARGIN,
                bottom: Dimen.ULTRA_SMALL),
            child: Text(
              text ?? "",
              textAlign: TextAlign.center,
              style: AppTextStyle.largeBold(color: AppColors.textDarkGrayColor),
            ),
          ),
        ],
      ),
    );
  }

  static Widget loadingWidget() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Drawables.logo,
            width: 150,
            height: 150,
          ),
          SizedBox(
            height: Dimen.BASE_MARGIN_LARGE,
          ),
          CircularProgressIndicator(
            valueColor:
                new AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
          ),
        ],
      ),
    );
  }

  static Widget button(String text,
      {Color textColor, Color backgroundColor, Color borderColor}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimen.BASE_MARGIN, vertical: Dimen.SMALL),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: backgroundColor ?? AppColors.primaryColor,
          border: Border.all(
              color:
                  borderColor ?? (backgroundColor ?? AppColors.primaryColor))),
      child: Text(
        text ?? "",
        maxLines: 1,
        softWrap: true,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle.smallBold(color: textColor ?? Colors.white),
      ),
    );
  }
}

Widget assetIconView(String iconsString, {double height, double width}) {
  return Container(
    padding: EdgeInsets.all(Dimen.TINY),
    child: Image.asset(
      iconsString ?? Drawables?.logo,
      width: width ?? null,
      height: height ?? null,
      // color: AppColors.blackColor,
      fit: BoxFit.fill,
    ),
  );
}
