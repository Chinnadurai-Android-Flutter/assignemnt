import 'package:Decor8/data/recent_transaction_model.dart';
import 'package:flutter/material.dart';

class AppStrings {
  static bool isDemoWihtUI = true;
  static String currentBalance = "current balance";
  static String manage = "manage";
  static String viewAll = "view all";
  static String recentTransaction = "recent transactions";
  static String yesBankText = "YESBANK - 2134";
  static String atmLocatorString = "ATM Locator";
  static String startLooking = "Start looking";
  static String exchangeMoney = "Exchange Money";
  static String exchangeNow = "exchange now";
  static String offerForYou = "Offer for you";
  static String offerText = "Up to 15% off* at Apollo Pharmacy";
  static String apolloPharmacy = "Apollo Pharmacy";
  static String exchangeMoneyContent =
      "Find you real-time Exchange rates & Exchange between your balances.";
  static String atmLocatorContentString =
      "Find a visa ATM near \nyour location";

  static List colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.blue,
    Colors.orange,
    Colors.deepPurpleAccent,
    Colors.purple,
    Colors.pink,
    Colors.greenAccent
  ];

  static List countryCodeList = [
    'USD',
    'AUD',
    'QAR',
    'ILS',
    'HKD',
    'BRL',
    'BHD',
  ];

  static List<RecentTransaction> recentTransactionList = [
    RecentTransaction(
        companyName: 'McDonalds',
        date: 'Sep 2',
        price: '123',
        time: '12.12 AM IST',
        imagePath: Icons.cloud_circle_outlined),
    RecentTransaction(
        companyName: 'Exchange from INR',
        date: 'Sep 3',
        price: '1256',
        time: '10.12 AM IST',
        imagePath: Icons.arrow_back_sharp),
    RecentTransaction(
        companyName: 'H&M Clothing',
        date: 'Sep 4',
        price: '129.99',
        time: '11.12 AM IST',
        imagePath: Icons.cleaning_services_outlined),
    RecentTransaction(
        companyName: 'Lead Currency USD',
        date: 'Sep 5',
        price: '150',
        time: '11.12 AM IST',
        imagePath: Icons.arrow_forward),
    RecentTransaction(
        companyName: 'ATM Withdrawal',
        date: 'Sep 6',
        price: '40',
        time: '6.00 PM IST',
        imagePath: Icons.local_atm_outlined),
  ];
}
