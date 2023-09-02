import 'dart:math';
import 'package:car_rental_app_ui/data/cars.dart'; // Import your data source
import 'package:car_rental_app_ui/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Padding buildCar(Car car, size, themeData) {
  return Padding(
    padding: EdgeInsets.only(
      right: size.width * 0.03,
      top: 16,
    ),
    child: Center(
      child: SizedBox(
        height: size.width * 0.9,
        width: size.width * 0.6,
        child: Container(
          decoration: BoxDecoration(
            color: themeData.cardColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.02,
            ),
            child: InkWell(
              onTap: () {
                Get.to(DetailsPage(
                  carImage: car.image,
                  carClass: car.category.toString(),
                  carName: car.title,
                  carPower: car.speed,
                  people: '1-${car.seats}',
                  bags: '1-${car.engine}',
                  carPrice: car.price,
                  carRating: '5',
                  isRotated: car.isRotated,
                ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.01,
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: car.isRotated
                          ? Image.asset(
                              car.image,
                              height: size.width * 0.25,
                              width: size.width * 0.5,
                              fit: BoxFit.contain,
                            )
                          : Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(pi),
                              child: Image.asset(
                                car.image,
                                height: size.width * 0.25,
                                width: size.width * 0.5,
                                fit: BoxFit.contain,
                              ),
                            ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Text(
                      car.category.toString(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: themeData.primaryColor,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    car.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: themeData.primaryColor,
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
