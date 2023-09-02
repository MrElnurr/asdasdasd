import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  final List<Car> cars;

  Welcome({
    required this.cars,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    cars: List<Car>.from(json["cars"].map((x) => Car.fromJson(x)))
  );

  Map<String, dynamic> toJson() => {
    "cars": List<dynamic>.from(cars.map((x) => x.toJson())),
    //"marks": List<dynamic>.from(marks.map((x) => x.toJson())),
  };
}

class Car {
  final int id;
  final String title;
  final Description description;
  final int price;
  final int speed;
  final int seats;
  final int engine;
  final String brand;
  final Category category;
  final String image;

  Car({
    required this.id,
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
    id: json["id"],
    title: json["title"],
    description: descriptionValues.map[json["description"]]!,
    price: json["price"],
    speed: json["speed"],
    seats: json["seats"],
    engine: json["engine"],
    brand: json["brand"],
    category: categoryValues.map[json["category"]]!,
    image: json["image"],
  );

  get isRotated => false;

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": descriptionValues.reverse[description],
    "price": price,
    "speed": speed,
    "seats": seats,
    "engine": engine,
    "brand": brand,
    "category": categoryValues.reverse[category],
    "image": image,
  };
}

enum Category {
  SEDAN,
  SPORT_CAR,
  SUV
}

final categoryValues = EnumValues({
  "Sedan": Category.SEDAN,
  "Sport Car": Category.SPORT_CAR,
  "SUV": Category.SUV
});

enum Description {
  A_CAR_WITH_HIGH_SPECS_THAT_IS_RENTED_AT_AN_AFFORDABLE_PRICE
}

final descriptionValues = EnumValues({
  "A car with high specs that is rented at an affordable price": Description.A_CAR_WITH_HIGH_SPECS_THAT_IS_RENTED_AT_AN_AFFORDABLE_PRICE
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