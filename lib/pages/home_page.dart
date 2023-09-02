import 'package:car_rental_app_ui/data/cars.dart';
import 'package:car_rental_app_ui/data/get_cars.dart';
import 'package:car_rental_app_ui/widgets/bottom_nav_bar.dart';

import 'package:car_rental_app_ui/widgets/homePage/most_rented.dart';
import 'package:car_rental_app_ui/widgets/homePage/top_brands.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //check the size of device
    ThemeData themeData = Theme.of(context);
    List<Car> cars = [];
    Future<void> getData() async {
      try {
        var response = await getCars();
        setState(() {
          cars = response;
        });
      } catch (e) {
        print(e);
      }
    }

    @override
    void initState() {
      //you are not allowed to add async modifier to initState
      getData();
      super.initState();
    }

    //this is async test function
    Future<String> testfunction() {
      print("This is test function");
      return Future(() => "abc");
    }

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: buildBottomNavBar(1, size, themeData),
      backgroundColor: themeData.backgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.04,
                left: size.width * 0.05,
                right: size.width * 0.05,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  color: themeData.cardColor, //section bg color
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(left: 16, top: 8),
                            child: CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                    'https://via.placeholder.com/140x100'))),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 16),
                              child: Align(
                                child: Text(
                                  'Welcome',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: themeData.primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Align(
                                child: Text(
                                  'John Doe',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: themeData.primaryColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        const Padding(
                            padding: EdgeInsets.only(right: 16, top: 8),
                            child: CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                    'https://via.placeholder.com/140x100')))
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.03,
                        left: size.width * 0.04,
                      ),
                      child: Stack(
                        children: [
                          SizedBox(
                            child: TextField(
                              //searchbar
                              style: GoogleFonts.poppins(
                                color: themeData.primaryColor,
                              ),
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    top: size.height * 0.01,
                                    left: size.width * 0.04,
                                    right: size.width * 0.04,
                                  ),
                                  enabledBorder: textFieldBorder(),
                                  focusedBorder: textFieldBorder(),
                                  border: textFieldBorder(),
                                  hintStyle: GoogleFonts.poppins(
                                    color: themeData.primaryColor,
                                  ),
                                  hintText: 'Search a car',
                                  prefixIcon: Icon(Icons.search)),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: 48,
                              width: 48,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40),
                                ),
                                color: Color(0xff030303), //filters bg color
                              ),
                              child: Icon(
                                UniconsLine.sliders_v,
                                color: Colors.white,
                                size: size.height * 0.032,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            buildTopBrands(size, themeData),
            buildMostRented(cars, size, themeData),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder textFieldBorder() {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(30.0)),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.5),
        width: 1.0,
      ),
    );
  }
}
