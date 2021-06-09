import 'dart:ui';

import 'package:Decor8/resources/app_colors.dart';
import 'package:Decor8/resources/app_fonts.dart';
import 'package:Decor8/resources/dimen.dart';
import 'package:flutter/material.dart';

class AppCustomAppbar extends StatefulWidget {
  final String toolBarName;

  const AppCustomAppbar({
    Key key,
    this.toolBarName,
  }) : super(key: key);

  @override
  _AppCustomAppbarState createState() => _AppCustomAppbarState();
}

class _AppCustomAppbarState extends State<AppCustomAppbar> {
  bool showCancel = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1.0,
      backwardsCompatibility: true,
      backgroundColor: Colors.black,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Container(
        child: Text(
          widget.toolBarName,
          maxLines: 1,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontFamily: AppFonts.poppinsMedium,
              fontStyle: FontStyle.normal,
              color: AppColors.textweight,
              fontSize: TextSize.MEDIUM,
              letterSpacing: 0.5,
              fontWeight: FontWeight.normal),
        ),
        padding: EdgeInsets.only(left: Dimen.SMALL, top: Dimen.MEDIUM),
      ),
      actions: <Widget>[
        menuButton(context),
      ],
    );
  }

  Widget menuButton(BuildContext context) {
    return Visibility(
      visible: true,
      child: IconButton(
        icon: new Icon(Icons.menu),
        color: AppColors.textweight,
        iconSize: 20,
        onPressed: () {},
      ),
    );
  }
}
