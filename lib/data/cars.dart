import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  final List<Car> cars;
  final List<Mark> marks;

  Welcome({
    required this.cars,
    required this.marks,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        cars: List<Car>.from(json["cars"].map((x) => Car.fromJson(x))),
        marks: List<Mark>.from(json["marks"].map((x) => Mark.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cars": List<dynamic>.from(cars.map((x) => x.toJson())),
        "marks": List<dynamic>.from(marks.map((x) => x.toJson())),
      };
}

class Car {
  final String title;
  final String description;
  final int price;
  final int speed;
  final int seats;
  final int engine;
  final String brand;
  final Category category;
  final String image;

  Car({
    required this.title,
    required this.description,
    required this.price,
    required this.speed,
    required this.seats,
    required this.engine,
    required this.brand,
    required this.category,
    required this.image,
  });

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        title: json["carName"],
        description: json["carClass"],
        price: json["carPrice"],
        speed: json["carPower"],
        seats: int.parse(
            json["people"].split('-')[1]), // Assuming "1-4" will be split to 4.
        engine: int.parse(
            json["engine"].split('-')[1]), // Assuming "1-3" will be split to 3.
        brand: json["brand"],
        category: categoryValues.map[json["category"]] ?? Category.SEDAN,
        image: json["carImage"],
      );

  get isRotated => false;

  Map<String, dynamic> toJson() => {
        "carName": title,
        "carClass": description,
        "carPrice": price,
        "carPower": speed,
        "people": "1-${seats}",
        "engine": "1-${engine}",
        "brand": brand,
        "category": categoryValues.reverse[category],
        "carImage": image,
      };
}

enum Category {
  SEDAN,
  SPORT_CAR,
  SUV,
}

final categoryValues = EnumValues({
  "Sedan": Category.SEDAN,
  "Sport": Category.SPORT_CAR,
  "City": Category.SUV,
});

class Mark {
  final int id;
  final String title;
  final String image;

  Mark({
    required this.id,
    required this.title,
    required this.image,
  });

  factory Mark.fromJson(Map<String, dynamic> json) => Mark(
        id: json["id"],
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
