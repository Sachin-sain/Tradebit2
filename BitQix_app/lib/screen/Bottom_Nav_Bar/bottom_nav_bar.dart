// ignore_for_file: must_be_immutable, camel_case_types

import 'package:exchange/config/SharedPreferenceClass.dart';
import 'package:exchange/screen/home/Staking/Constants/Common.dart';
import 'package:exchange/screen/home/home.dart';
import 'package:exchange/screen/intro/login.dart';
import 'package:exchange/screen/market/markets.dart';
import 'package:exchange/screen/history/Product_History.dart';
import 'package:exchange/screen/wallet/wallet.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:exchange/config/constantClass.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:wakelock/wakelock.dart';

import '../history/Complete_Order.dart';

class bottomNavBar extends StatefulWidget {
  int index;
  bottomNavBar({this.index});

  _bottomNavBarState createState() => _bottomNavBarState(currentIndex: index);
}

class _bottomNavBarState extends State<bottomNavBar> {
  int currentIndex;
  _bottomNavBarState({this.currentIndex});
  String status;
  String token;
  bool loading = true;

  Widget callPage(int current) {
    switch (current) {
      case 0:
        return new home();
        break;
      case 1:
        return new market();
        break;
      case 2:
        return status == "true" ? Product_History() : login();
        break;
      case 3:
        return status == "true" ? wallet() : login();
        break;
      // case 4:
      //   return new setting(themeBloc: widget.themeBloc);
      //   break;
      default:
        return new home();
    }
  }

  @override
  void initState() {
    Wakelock.enable();
    checkstatus();
    getRate();
    getcompletedata(1);
    print("djkjskkl");
    // getremainingorder(1);
    // getremainingorder(1);
    //checkConnectivityState();
    for (int i = 0; i < marketfamily.length; i++) {
      BTCAPI(CurrencyName: marketfamily[i].toString());
    }

    super.initState();
  }

  checkstatus() async {
    status = await SharedPreferenceClass.GetSharedData("isLogin");
    token = await SharedPreferenceClass.GetSharedData("token");

    setState(() {
      status = status;
      token = token;
      loading = false;
      print("BTC API HIT" + status.toString());
      print("BTC API HIT" + token.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff17394f),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : callPage(currentIndex),
      bottomNavigationBar: FloatingNavbar(
          selectedBackgroundColor: Colors.white,
          selectedItemColor: Color(0xff176980),
          backgroundColor: Colors.transparent,
          onTap: (int val) => setState(() => currentIndex = val),
          currentIndex: currentIndex,
          items: <FloatingNavbarItem>[
            FloatingNavbarItem(
              icon: Icons.home,
              title: "Home",
            ),
            FloatingNavbarItem(icon: Icons.stacked_bar_chart, title: "Market"),
            FloatingNavbarItem(icon: Icons.library_books, title: "Orders"),
            FloatingNavbarItem(
              icon: Icons.account_balance_wallet,
              title: "Wallet",
            ),
            // FloatingNavbarItem(
            //     icon: Icons.settings,
            //     ),
          ]),
    );
  }
}
