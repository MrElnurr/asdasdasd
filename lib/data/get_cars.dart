import 'package:car_rental_app_ui/data/cars.dart';
import 'package:dio/dio.dart';

Future<List<Car>> getCars() async {
  var url = 'http://45.87.173.234:10/car';
  var res = await Dio().get(url);

  try {
    if (res.statusCode == 200) {
      var body = res.data as List;
      return body.map((e) => Car.fromJson(e)).toList();
    }
    // ignore: avoid_print
    print(res.statusCode);
  } catch (e) {
    // ignore: avoid_print
    print('Sehv var: $e');
  }
  return [];
}
