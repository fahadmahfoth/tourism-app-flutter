// To parse this JSON data, do
//
//     final seen = seenFromMap(jsonString);

import 'dart:convert';

Seen seenFromMap(String str) => Seen.fromMap(json.decode(str));

String seenToMap(Seen data) => json.encode(data.toMap());

class Seen {
  Seen({
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
    this.createdAt,
  });

  final int id;
  final int categoryId;
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
  final DateTime createdAt;

  factory Seen.fromMap(Map<String, dynamic> json) => Seen(
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
        createdAt: DateTime.parse(json["created_at"]),
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
        "created_at": createdAt.toIso8601String(),
      };
}
