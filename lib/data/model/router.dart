// To parse this JSON data, do
//
//     final router = routerFromMap(jsonString);

import 'dart:convert';

class Router {
  final String? name;
  final String? date;
  final String? startHour;
  final String? endHour;
  final String? origin;
  final String? destiny;
  final String? duration;

  Router({
    this.name,
    this.date,
    this.startHour,
    this.endHour,
    this.origin,
    this.destiny,
    this.duration,
  });

  Router copyWith({
    String? name,
    String? date,
    String? startHour,
    String? endHour,
    String? origin,
    String? destiny,
    String? duration,
  }) =>
      Router(
        name: name ?? this.name,
        date: date ?? this.date,
        startHour: startHour ?? this.startHour,
        endHour: endHour ?? this.endHour,
        origin: origin ?? this.origin,
        destiny: destiny ?? this.destiny,
        duration: duration ?? this.duration,
      );

  factory Router.fromJson(String str) => Router.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Router.fromMap(Map<String, dynamic> json) => Router(
        name: json["name"],
        date: json["date"],
        startHour: json["startHour"],
        endHour: json["endHour"],
        origin: json["origin"],
        destiny: json["destiny"],
        duration: json["duration"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "date": date,
        "startHour": startHour,
        "endHour": endHour,
        "origin": origin,
        "destiny": destiny,
        "duration": duration,
      };
}

class EntityRouter {
  String? name;
  String? date;
  String? startHour;
  String? endHour;
  String? origin;
  String? destiny;
  bool? state;

  EntityRouter({
    this.name,
    this.date,
    this.startHour,
    this.endHour,
    this.origin,
    this.destiny,
    this.state,
  });

  factory EntityRouter.fromJson(String str) =>
      EntityRouter.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EntityRouter.fromMap(Map<String, dynamic> json) => EntityRouter(
        name: json["name"],
        date: json["date"],
        startHour: json["startHour"],
        endHour: json["endHour"],
        origin: json["origin"],
        destiny: json["destiny"],
        state: json["state"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "date": date,
        "startHour": startHour,
        "endHour": endHour,
        "origin": origin,
        "destiny": destiny,
        "state": state,
      };
}
