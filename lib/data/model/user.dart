// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

class User {
  final String? name;
  final String? lastName;
  final String? company;
  final int? companyId;
  final String? phone;
  final String? address;
  final String? email;
  final int? age;
  final String? urlImage;

  User({
    this.name,
    this.lastName,
    this.company,
    this.companyId,
    this.phone,
    this.address,
    this.email,
    this.age,
    this.urlImage,
  });

  User copyWith({
    String? name,
    String? lastName,
    String? company,
    int? companyId,
    String? phone,
    String? address,
    String? email,
    int? age,
    String? urlImage,
  }) =>
      User(
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        company: company ?? this.company,
        companyId: companyId ?? this.companyId,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        email: email ?? this.email,
        age: age ?? this.age,
        urlImage: urlImage ?? this.urlImage,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["name"],
        lastName: json["lastName"],
        company: json["company"],
        companyId: json["companyId"],
        phone: json["phone"],
        address: json["address"],
        email: json["email"],
        age: json["age"],
        urlImage: json["urlImage"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "lastName": lastName,
        "company": company,
        "companyId": companyId,
        "phone": phone,
        "address": address,
        "email": email,
        "age": age,
        "urlImage": urlImage,
      };
}
