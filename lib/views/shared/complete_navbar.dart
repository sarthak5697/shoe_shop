

import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/mainscreen_provider.dart';
import 'package:flutter_shop/views/shared/bottom_navbar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class CompleteBottomNavigationBar extends StatelessWidget {
  const CompleteBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context,mainScreenNotifier,child){
        return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavBar(
                onTap: () {
                  mainScreenNotifier.pageIndex = 0;
                },
                icon: mainScreenNotifier.pageIndex == 0
                    ? Ionicons.home
                    : Ionicons.home_outline,
              ),
              BottomNavBar(
                onTap: () {
                  mainScreenNotifier.pageIndex = 1;
                },
                  icon: mainScreenNotifier.pageIndex == 1
                    ? Ionicons.search
                    : Ionicons.search_outline,
              ),
              BottomNavBar(
                onTap: () {
                  mainScreenNotifier.pageIndex = 2;
                },
                 icon: mainScreenNotifier.pageIndex == 2
                    ? Ionicons.add_circle
                    : Ionicons.add_circle_outline,
              ),
              BottomNavBar(
                onTap: () {
                  mainScreenNotifier.pageIndex = 3;
                },
                  icon: mainScreenNotifier.pageIndex == 3
                    ? Ionicons.cart
                    : Ionicons.cart_outline,
              ),
              BottomNavBar(
                onTap: () {
                  mainScreenNotifier.pageIndex = 4;
                },
                  icon: mainScreenNotifier.pageIndex == 4
                    ? Ionicons.person
                    : Ionicons.person_outline,
              ),
            ],
          ),
        ),
      ),
    );
 
      }
    );
     }
}
