import 'package:checkoutapp/pages/Home.dart';
import 'package:checkoutapp/pages/cart.dart';
import 'package:checkoutapp/pages/categories.dart';
import 'package:checkoutapp/pages/profile.dart';
import 'package:checkoutapp/pages/scanner.dart';
import 'package:checkoutapp/pages/shop.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentTabIndex = 0;
  late List<Widget> pages;

  late Widget currentPage;

  late Home homepage;

  late Home shop;
  late Profile newCart;
  late Scanner scan;

  @override
  void initState() {
    super.initState();

    homepage = Home();

    shop = Home();
    newCart = Profile();
    scan = Scanner();
    pages = [shop, homepage, newCart, scan];
    currentPage = homepage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
            currentPage = pages[index];
          });
        },
        selectedItemColor: Colors.green,
        selectedLabelStyle:
            TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500),
        unselectedLabelStyle:
            TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500),
        currentIndex: currentTabIndex,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: "Shop",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_outlined),
              label: "Account",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner_rounded),
              label: "Scanner",
              backgroundColor: Colors.transparent),
        ],
      ),
      body: currentPage,
    );
  }
}
