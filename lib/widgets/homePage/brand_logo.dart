import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Padding buildBrandLogo(
    Widget image, Size size, ThemeData themeData, String name) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: size.width * 0.03,
    ),
    child: Column(
      children: [
        SizedBox(
          height: size.width * 0.18,
          width: size.width * 0.18,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  50,
                ),
              ),
            ),
            child: Center(
              child: image,
            ),
          ),
        ),
        Text(
          "$name",
          style: GoogleFonts.poppins(
            color: Colors.grey.shade700,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        )
      ],
    ),
  );
}
