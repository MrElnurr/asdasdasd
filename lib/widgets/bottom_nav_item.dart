import 'package:flutter/material.dart';

BottomNavigationBarItem buildBottomNavItem(
    IconData icon, ThemeData themeData, Size size) {
  return BottomNavigationBarItem(
    icon: SizedBox(
      height: size.width * 0.12,
      width: size.width * 0.12,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    ),
    label: '',
  );
}
