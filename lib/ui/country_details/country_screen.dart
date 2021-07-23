import 'package:Decor8/base/base_state.dart';
import 'package:Decor8/data/country_details.dart';
import 'package:Decor8/data/country_model.dart';
import 'package:Decor8/resources/app_colors.dart';
import 'package:Decor8/resources/app_errors.dart';
import 'package:Decor8/resources/dimen.dart';
import 'package:Decor8/utility/app_text_style.dart';
import 'package:Decor8/utility/custom_appbar.dart';
import 'package:Decor8/utility/widget_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'country_bloc.dart';
import 'country_event.dart';

class CountryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CountryScreenState();
  }
}

class _CountryScreenState extends State<CountryScreen> {
  int selectedIndex = 0;
  String _currentlyCPDField = "USD";
  TextEditingController _controller;
  int convertedCurrencyValues;
  List<Country> itemList = [];
  List<Country> selectedCountryList = [];
  var _textController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = "1";
    convertedCurrencyValues = 1;
  }

  @override
  Widget build(BuildContext context) {
   /* return Scaffold(
      body: BlocProvider(
        create: (context) => CountryBloc()
          ..add(
            GetCountry(),
          ),
        child: BlocListener<CountryBloc, BaseState>(
          listener: (context, state) {
            if (state is FailureState) {
              WidgetUtils.showSnackBar(context, state.errorMessage);
            } else if (state is SuccessState) {
              print("${state.successResponse}");
              itemList = state.successResponse;
            }
          },
          child: BlocBuilder<CountryBloc, BaseState>(
            builder: (context, state) {
              if (state is FailureState) {
                return WidgetUtils.errorWidget(AppErrors.tryAgainError);
              } else if (state is LoadingState) {
                return WidgetUtils.loadingWidget();
              } else if (state is UnderConstructionState) {
                return WidgetUtils.errorWidget(
                    AppErrors.underConstructionError);
              } else if (state is SuccessState) {
                return Column(
                  children: [
                    AppCustomAppbar(
                      toolBarName: itemList[1].countryName,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        child: Column(
                          children: [
                            offerForYou(context, itemList),
                            SizedBox(
                              height: Dimen.MEDIUM,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );*/
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<CountryBloc>(
            create: (context) => CountryBloc()
              ..add(
                GetCountry(),
              ),
          ),
          BlocProvider<EventListBloc>(
            create: (context) => CountryBloc()
              ..add(
                GetCountry(),
              ),
          ),

        ],
        child: BlocListener<CountryBloc, BaseState>(
          listener: (context, state) {
            if (state is FailureState) {
              WidgetUtils.showSnackBar(context, state.errorMessage);
            } else if (state is SuccessState) {
              print("${state.successResponse}");
              itemList = state.successResponse;
            }
          },
          child: BlocBuilder<CountryBloc, BaseState>(
            builder: (context, state) {
              if (state is FailureState) {
                return WidgetUtils.errorWidget(AppErrors.tryAgainError);
              } else if (state is LoadingState) {
                return WidgetUtils.loadingWidget();
              } else if (state is UnderConstructionState) {
                return WidgetUtils.errorWidget(
                    AppErrors.underConstructionError);
              } else if (state is SuccessState) {
                return Column(
                  children: [
                    AppCustomAppbar(
                      toolBarName: itemList[1].countryName,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        child: Column(
                          children: [
                            offerForYou(context, itemList),
                            SizedBox(
                              height: Dimen.MEDIUM,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget offerForYou(BuildContext context, List<Country> lisItem) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimen.MEDIUM),
          topRight: Radius.circular(Dimen.MEDIUM),
          bottomLeft: Radius.circular(Dimen.VERY_SMALL),
          bottomRight: Radius.circular(Dimen.VERY_SMALL),
        ),
      ),
      margin: EdgeInsets.only(
          left: Dimen.MEDIUM, top: Dimen.MEDIUM, right: Dimen.MEDIUM),
      child: Container(
        margin: EdgeInsets.only(
            left: Dimen.MEDIUM, top: Dimen.MEDIUM, right: Dimen.MEDIUM),
        alignment: Alignment.center,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.network(
              itemList[1].flag,
              placeholderBuilder: (BuildContext context) => Container(
                alignment: Alignment.center,
                child: WidgetUtils.placeHolder(true),
              ),
              fit: BoxFit.contain,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  itemList[1].countryName,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  style: AppTextStyle.mediumBold(color: AppColors.blackColor),
                ),
                SizedBox(
                  width: Dimen.VERY_SMALL,
                ),
                Text(
                  itemList[1].currencyCode,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  style: AppTextStyle.small(color: AppColors.borderGray),
                ),
              ],
            ),
            SizedBox(
              height: Dimen.ULTRA_SMALL,
            ),
          ],
        ),
        //padding: EdgeInsets.all(Dimen.SMALL),
      ),
    );
  }
}

enum SingingCharacter { home, offer, setting }
