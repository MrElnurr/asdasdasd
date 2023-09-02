import 'package:car_rental_app_ui/data/cars.dart';
import 'package:car_rental_app_ui/widgets/homePage/car.dart';
import 'package:car_rental_app_ui/widgets/homePage/category.dart';
import 'package:flutter/material.dart';

Widget buildMostRented(List<Car> cars, Size size, ThemeData themeData) {
  //List<Car> car = [];
  return Padding(
    padding: const EdgeInsets.only(top: 16.0),
    child: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        color: Color.fromARGB(255, 241, 238, 238),
      ),
      child: Column(
        children: [
          buildCategory('Most Rented', size, themeData),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.015,
              left: size.width * 0.03,
              right: size.width * 0.03,
            ),
            child: SizedBox(
                height: 500,
                width: 500,
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(cars.length, (index) {
                    return buildCar(
                      cars[index],
                      size,
                      themeData,
                    );
                  }),
                )),
          ),
        ],
      ),
    ),
  );
}
