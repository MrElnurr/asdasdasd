import 'dart:convert';

import 'package:car_rental_app_ui/data/cars.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

Future<List<Car>> getCars() async {
  var url = 'http://45.87.173.234:10/car';
  var res = await Dio().get(url);

  try {
    print(res.data);
    if (res.statusCode == 200) {
      final data = json.decode(res.data) as Map<String, dynamic>;
      final welcome = Welcome.fromJson(data);
      return welcome.cars;
    }
    // ignore: avoid_print
    print(res.statusCode);
  } catch (e) {
    // ignore: avoid_print
    print('Sehv var: $e');
  }
  return [];
}

Future<List<Car>> getCars2() async {
  try {
    var url = 'http://45.87.173.234:10/car';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print("saalm");
      print(response.body);
      final welcome = Welcome.fromJson(jsonDecode(response.body));
      return welcome.cars;
    } else {
      throw Exception('Failed to load cars');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}
