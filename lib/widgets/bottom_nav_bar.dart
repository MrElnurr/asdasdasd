import 'package:car_rental_app_ui/pages/home_page.dart';
import 'package:car_rental_app_ui/widgets/bottom_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

Widget buildBottomNavBar(int currIndex, Size size, ThemeData themeData) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        color: Color(0xffdad3d3), //filters bg color
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0)
        ),
        child: BottomNavigationBar(
          iconSize: size.width * 0.07,
          elevation: 0,
          selectedLabelStyle: const TextStyle(fontSize: 0),
          unselectedLabelStyle: const TextStyle(fontSize: 0),
          currentIndex: currIndex,
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: themeData.brightness == Brightness.dark
              ? Colors.white
              : Colors.grey,
          unselectedItemColor: Colors.grey,
          onTap: (value) {
            if (value != currIndex) {
              if (value == 1) {
                Get.off(const HomePage());
              }
            }
          },
          items: [
            buildBottomNavItem(
              UniconsLine.bell,
              themeData,
              size,
            ),
            buildBottomNavItem(
              UniconsLine.map_marker,
              themeData,
              size,
            ),
            buildBottomNavItem(
              UniconsLine.user,
              themeData,
              size,
            ),
            buildBottomNavItem(
              UniconsLine.apps,
              themeData,
              size,
            ),
          ],
        ),
      ),
    ),
  );
}
