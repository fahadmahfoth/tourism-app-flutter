import 'dart:convert';

Favorite favoriteFromMap(String str) => Favorite.fromMap(json.decode(str));

String favoriteToMap(Favorite data) => json.encode(data.toMap());

class Favorite {
  Favorite({
    this.id,
    this.categoryId,
    this.name,
    this.contente,
    this.phoneNumber,
    this.city,
    this.timeUp,
    this.timeDown,
    this.days,
    this.image,
    this.mapLat,
    this.mapLng,
  });

  final int id;
  final String categoryId;
  final String name;
  final String contente;
  final String phoneNumber;
  final String city;
  final String timeUp;
  final String timeDown;
  final String days;
  final String image;
  final String mapLat;
  final String mapLng;

  factory Favorite.fromMap(Map<String, dynamic> json) => Favorite(
        id: json["id"],
        categoryId: json["category_id"],
        name: json["name"],
        contente: json["contente"],
        phoneNumber: json["phone_number"],
        city: json["city"],
        timeUp: json["time_up"],
        timeDown: json["time_down"],
        days: json["days"],
        image: json["image"],
        mapLat: json["map_lat"],
        mapLng: json["map_lng"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "contente": contente,
        "phone_number": phoneNumber,
        "city": city,
        "time_up": timeUp,
        "time_down": timeDown,
        "days": days,
        "image": image,
        "map_lat": mapLat,
        "map_lng": mapLng,
      };
}
