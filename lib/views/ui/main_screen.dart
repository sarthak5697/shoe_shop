import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/mainscreen_provider.dart';
import 'package:flutter_shop/views/shared/complete_navbar.dart';
import 'package:flutter_shop/views/ui/cart_page.dart';
import 'package:flutter_shop/views/ui/home_page.dart';
import 'package:flutter_shop/views/ui/product_by_cat.dart';
import 'package:flutter_shop/views/ui/profile.dart';
import 'package:flutter_shop/views/ui/search_page.dart';
import 'package:provider/provider.dart';


// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    ProductByCat(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
        builder: (context, mainScreenNotifier, child) {
      return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        body: pageList[mainScreenNotifier.pageIndex],
        bottomNavigationBar: const CompleteBottomNavigationBar(),
      );
    });
  }
}