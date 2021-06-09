import 'package:Decor8/base/base_state.dart';
import 'package:Decor8/data/country_model.dart';
import 'package:Decor8/resources/app_colors.dart';
import 'package:Decor8/resources/app_errors.dart';
import 'package:Decor8/resources/app_fonts.dart';
import 'package:Decor8/resources/app_strings.dart';
import 'package:Decor8/resources/dimen.dart';
import 'package:Decor8/resources/drawables.dart';
import 'package:Decor8/utility/app_text_style.dart';
import 'package:Decor8/utility/custom_appbar.dart';
import 'package:Decor8/utility/widget_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event_list_bloc.dart';
import 'event_list_event.dart';

class EventListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EventListScreenState();
  }
}

class _EventListScreenState extends State<EventListScreen> {
  int selectedIndex = 0;
  String _currentlyCPDField = "USD";
  TextEditingController _controller;
  int convertedCurrencyValues;
  List<Country> itemList = [];
  List<Country> selectedCountryList = [];
  var _textController = new TextEditingController();
  int _value = 0;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = "1";
    convertedCurrencyValues = 16;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomView(),
      body: BlocProvider(
        create: (context) => EventListBloc()
          ..add(
            GetCountryList(),
          ),
        child: BlocListener<EventListBloc, BaseState>(
          listener: (context, state) {
            if (state is FailureState) {
              WidgetUtils.showSnackBar(context, state.errorMessage);
            } else if (state is SuccessState) {
              print("${state.successResponse}");
              itemList = state.successResponse;
              itemList.forEach((countryList) {
                AppStrings.countryCodeList.forEach((countryCodeList) {
                  if (countryList.currencyCode == countryCodeList) {
                    var present = false;
                    selectedCountryList.forEach((element) {
                      if (countryCodeList == element.currencyCode) {
                        present = true;
                      }
                    });
                    if (!present) {
                      selectedCountryList.add(countryList);
                    }
                  }
                });
              });
            }
          },
          child: BlocBuilder<EventListBloc, BaseState>(
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
                      toolBarName: AppStrings.currentBalance,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        child: Column(
                          children: [
                            buildCountryCodeWidget(context),
                            SizedBox(
                              height: Dimen.MEDIUM,
                            ),
                            WidgetUtils().headerBodyView(
                                context, false, AppStrings.recentTransaction,
                                trailing: AppStrings.viewAll),
                            buildRecentTransactionWidget(context),
                            SizedBox(
                              height: Dimen.MEDIUM,
                            ),
                            WidgetUtils().atmLocatorView(context),
                            SizedBox(
                              height: Dimen.MEDIUM,
                            ),
                            Container(
                              child: exchangeMoneyView(context),
                            ),
                            SizedBox(
                              height: Dimen.MEDIUM,
                            ),
                            WidgetUtils().headerBodyView(
                                context, false, AppStrings.offerForYou,
                                trailing: AppStrings.viewAll),
                            offerForYou(context),
                            SizedBox(
                              height: Dimen.MEDIUM,
                            ),
                          ],
                        ),
                      ),
                    ),
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

  Widget bottomView() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(right: 5.0, left: 5.0, top: 10.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () => setState(() => _value = 0),
            child: Container(
              padding: EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 5.0, bottom: 5.0),
              decoration: BoxDecoration(
                  color: _value == 0
                      ? AppColors.appPrimaryBlue
                      : Colors.blueGrey[50],
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.home,
                      color: _value == 0 ? Colors.white : Colors.grey[600],
                      size: 24,
                    ),
                  ),
                  Text(
                    "Home",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.small(
                        color: _value == 0 ? Colors.white : Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => _value = 1),
            child: Container(
              padding: EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 5.0, bottom: 5.0),
              decoration: BoxDecoration(
                  color: _value == 1
                      ? AppColors.appPrimaryBlue
                      : Colors.blueGrey[50],
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Row(
                children: [
                  Container(
                    height: 26,
                    width: 26,
                    child: Icon(
                      Icons.local_offer,
                      color: _value == 1 ? Colors.white : Colors.grey[600],
                    ),
                  ),
                  Text(
                    "Offers",
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    style: AppTextStyle.small(
                        color: _value == 1 ? Colors.white : Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => _value = 2),
            child: Container(
              padding: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
              decoration: BoxDecoration(
                  color: _value == 2
                      ? AppColors.appPrimaryBlue
                      : Colors.blueGrey[50],
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Row(
                children: [
                  Container(
                    height: 26,
                    width: 26,
                    child: Icon(
                      Icons.settings_applications_rounded,
                      color: _value == 2 ? Colors.white : Colors.grey[600],
                    ),
                  ),
                  Text(
                    "Settings",
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    style: AppTextStyle.small(
                        color: _value == 2 ? Colors.white : Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget offerForYou(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.asset(
                Drawables.sample,
                // height: 140,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Dimen.MEDIUM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.apolloPharmacy,
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    style: AppTextStyle.mediumBold(color: AppColors.blackColor),
                  ),
                  Row(
                    children: [
                      Text(
                        AppStrings.offerText,
                        maxLines: 3,
                        textAlign: TextAlign.start,
                        style: AppTextStyle.small(color: AppColors.borderGray),
                      ),
                      SizedBox(
                        width: Dimen.VERY_SMALL,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColors.primaryColor,
                        size: 15,
                      ),
                    ],
                  )
                ],
              ),
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

  Widget exchangeMoneyView(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(Dimen.MEDIUM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.exchangeMoney,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: AppTextStyle.mediumBold(color: AppColors.blackColor),
                  ),
                  SizedBox(
                    height: Dimen.VERY_SMALL,
                  ),
                  Text(
                    AppStrings.exchangeMoneyContent,
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    style: AppTextStyle.small(color: AppColors.borderGray),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimen.ULTRA_SMALL,
            ),
            Container(
              height: 0.25,
              color: AppColors.borderGray,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimen.MEDIUM),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isDense: false,
                            underline: null,
                            dropdownColor: Colors.white,
                            elevation: 5,
                            value: _currentlyCPDField,
                            isExpanded: false,
                            style: TextStyle(
                                color: AppColors.textBlackColor,
                                fontSize: TextSize.X_LARGE,
                                fontStyle: FontStyle.normal,
                                fontFamily: AppFonts.poppins,
                                fontWeight: FontWeight.w400),
                            items: <String>[
                              'USD',
                              'AUD',
                              'QAR',
                              'AED',
                              'NZD',
                              'NPR',
                              'MUR',
                              'KWD',
                              'ILS',
                              'HKD',
                              'BRL',
                              'BHD',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String value) {
                              setState(() {
                                _currentlyCPDField = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Text(
                        'Balance: \$1,319',
                        maxLines: 3,
                        textAlign: TextAlign.start,
                        style: AppTextStyle.small(color: AppColors.borderGray),
                      ),
                    ],
                  ),
                  Container(
                    width: 70,
                    child: TextFormField(
                      decoration: new InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        setState(() {
                          var values = int.parse(text);
                          convertedCurrencyValues = (values * 16);
                        });
                      },
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: TextSize.XX_LARGE,
                          fontStyle: FontStyle.normal,
                          fontFamily: AppFonts.poppins,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                      controller: _controller,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimen.ULTRA_SMALL,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(Dimen.MEDIUM),
                  height: 0.25,
                  color: AppColors.borderGray,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimen.MEDIUM, vertical: Dimen.TINY),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Text(
                    '1\$ = 16',
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    style: AppTextStyle.small(color: AppColors.textweight),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimen.ULTRA_SMALL,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimen.MEDIUM),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'INR',
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    style: AppTextStyle.mediumBold(color: AppColors.borderGray),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 70,
                    child: Text(
                      '$convertedCurrencyValues',
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: TextSize.XX_LARGE,
                          fontStyle: FontStyle.normal,
                          fontFamily: AppFonts.poppins,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimen.ULTRA_SMALL,
            ),
            Container(
              height: 0.25,
              color: AppColors.borderGray,
            ),
            Padding(
              padding: EdgeInsets.all(Dimen.MEDIUM),
              child: WidgetUtils.button(AppStrings.exchangeNow,
                  textColor: AppColors.textweight,
                  backgroundColor: AppColors.appPrimaryBlue),
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

  Widget buildCountryCodeWidget(BuildContext context) {
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
        child: countryList(isHeader: true),
      ),
    );
  }

  Widget buildRecentTransactionWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimen.MEDIUM, top: Dimen.MEDIUM, right: Dimen.MEDIUM),
      child: recentTransactionList(isHeader: false),
    );
  }

  Widget countryList({bool isHeader}) {
    return Expanded(
      child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: selectedCountryList.length,
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: 0.5,
              color: AppColors.borderGray,
              indent: 10,
              thickness: 0.5,
              endIndent: 20,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  isHeader
                      ? index == 0
                          ? WidgetUtils().listViewHeaderView(context,
                              AppColors.milkWhite, true, AppStrings.yesBankText,
                              iconImage: Drawables.visa)
                          : SizedBox()
                      : SizedBox(),
                  WidgetUtils().listViewItem(selectedCountryList[index])
                ],
              );
            },
          )),
    );
  }

  Widget recentTransactionList({bool isHeader}) {
    return Expanded(
      child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: AppStrings.recentTransactionList.length,
            itemBuilder: (BuildContext context, int index) {
              return WidgetUtils()
                  .recentViewItem(AppStrings.recentTransactionList[index]);
            },
          )),
    );
  }
}
