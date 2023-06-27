import 'package:intl/intl.dart';

class UserProfile {
  UserProfile({
    required this.user,
    required this.driver,
    required this.companies,
    required this.factories,
    required this.products,
    required this.routes,
    required this.routeActive,
    this.onRoute = false,
  });

  final User? user;
  final Driver? driver;
  final List<Company> companies;
  final List<Company> factories;
  final List<Product> products;
  final List<Route> routes;
  Route? routeActive;
  bool onRoute = false;

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        driver: json["driver"] == null ? null : Driver.fromJson(json["driver"]),
        companies: json["companies"] == null
            ? []
            : List<Company>.from(
                json["companies"]!.map((x) => Company.fromJson(x))),
        factories: json["factories"] == null
            ? []
            : List<Company>.from(
                json["factories"]!.map((x) => Company.fromJson(x))),
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
        routes: json["routes"] == null
            ? []
            : List<Route>.from(json["routes"]!.map((x) => Route.fromJson(x))),
        routeActive: json["route_active"] == null
            ? null
            : Route.fromJson(json["route_active"]),
        onRoute: json["on_route"] ?? false);
  }

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "driver": driver?.toJson(),
        "companies": companies.map((x) => x?.toJson()).toList(),
        "factories": factories.map((x) => x?.toJson()).toList(),
        "products": products.map((x) => x?.toJson()).toList(),
        "routes": routes.map((x) => x?.toJson()).toList(),
        "route_active": routeActive?.toJson(),
        "on_route": onRoute
      };

  @override
  String toString() {
    return "$user, $driver, $companies, $factories, $products, $routes, $routeActive, ";
  }
}

class Company {
  Company(
      {required this.id,
      required this.name,
      required this.nit,
      required this.address,
      required this.email,
      required this.phone,
      this.selected = false,
      this.index = -1});

  final int id;
  final String name;
  final String nit;
  final String address;
  final String email;
  final String phone;
  bool selected = false;
  int index = -1;

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      nit: json["nit"] ?? "",
      address: json["address"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "nit": nit,
        "address": address,
        "email": email,
        "phone": phone,
      };

  @override
  String toString() {
    return "$id, $name, $nit, $address, $email, $phone, ";
  }
}

class Driver {
  Driver({
    required this.id,
    required this.name,
    required this.lastName,
    required this.birthDate,
    required this.identityCard,
    required this.identityCardExt,
    required this.driverLicense,
    required this.driverLicenseCategory,
    required this.driverLicenseExpiration,
    required this.truckIdentity,
    required this.truckDescription,
    required this.truckCapacity,
  });

  final int id;
  final String name;
  final String lastName;
  final DateTime? birthDate;
  final String identityCard;
  final String identityCardExt;
  final String driverLicense;
  final String driverLicenseCategory;
  final DateTime? driverLicenseExpiration;
  final String truckIdentity;
  final String truckDescription;
  final String truckCapacity;

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      lastName: json["last_name"] ?? "",
      birthDate: DateTime.tryParse(json["birth_date"] ?? ""),
      identityCard: json["identity_card"] ?? "",
      identityCardExt: json["identity_card_ext"] ?? "",
      driverLicense: json["driver_license"] ?? "",
      driverLicenseCategory: json["driver_license_category"] ?? "",
      driverLicenseExpiration:
          DateTime.tryParse(json["driver_license_expiration"] ?? ""),
      truckIdentity: json["truck_identity"] ?? "",
      truckDescription: json["truck_description"] ?? "",
      truckCapacity: json["truck_capacity"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "last_name": lastName,
        "birth_date": "${birthDate}",
        "identity_card": identityCard,
        "identity_card_ext": identityCardExt,
        "driver_license": driverLicense,
        "driver_license_category": driverLicenseCategory,
        "driver_license_expiration": "${driverLicenseExpiration}",
        "truck_identity": truckIdentity,
        "truck_description": truckDescription,
        "truck_capacity": truckCapacity,
      };

  @override
  String toString() {
    return "$id, $name, $lastName, $birthDate, $identityCard, $identityCardExt, $driverLicense, $driverLicenseCategory, $driverLicenseExpiration, $truckIdentity, $truckDescription, $truckCapacity, ";
  }
}

class Product {
  Product({
    required this.productoId,
    required this.description,
    required this.descriptionShort,
    required this.measureUnit,
    required this.color,
  });

  final int productoId;
  final String description;
  final String descriptionShort;
  final String measureUnit;
  final String color;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productoId: json["producto_id"] ?? 0,
      description: json["description"] ?? "",
      descriptionShort: json["description_short"] ?? "",
      measureUnit: json["measure_unit"] ?? "",
      color: json["color"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "producto_id": productoId,
        "description": description,
        "description_short": descriptionShort,
        "measure_unit": measureUnit,
        "color": color,
      };

  @override
  String toString() {
    return "$productoId, $description, $descriptionShort, $measureUnit, $color, ";
  }
}

class Route {
  Route({
    required this.id,
    required this.name,
    required this.truckName,
    required this.truckIdentity,
    required this.truckDescription,
    required this.status,
    required this.dateStart,
    required this.dateFinish,
    required this.productoId,
    required this.product,
    required this.quantity,
    required this.locations,
  });

  final int id;
  final String name;
  final String truckName;
  final String truckIdentity;
  final String truckDescription;
  final String status;
  final DateTime? dateStart;
  final DateTime? dateFinish;
  final int productoId;
  final String product;
  final String quantity;
  final List<Location> locations;

  String diffInHour() {
    if (dateStart != null && dateFinish != null) {
      Duration diff = dateFinish!.difference(dateStart!);
      return "${diff.inHours}:${diff.inMinutes.remainder(60)} Hr.";
    }
    return "0 Hr.";
  }

  String getDateStart() {
    if (dateFinish != null) {
      String date = DateFormat('dd/MM hh:mm').format(dateStart!);
      return date;
    }
    return '';
  }

  String getDateFinish() {
    if (dateFinish != null) {
      String date = DateFormat('dd/MM hh:mm').format(dateFinish!);
      return date;
    }
    return '';
  }

  factory Route.fromJson(Map<String, dynamic> json) {
    return Route(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      truckName: json["truck_name"] ?? "",
      truckIdentity: json["truck_identity"] ?? "",
      truckDescription: json["truck_description"] ?? "",
      status: json["status"] ?? "",
      dateStart: DateTime.tryParse(json["date_start"] ?? ""),
      dateFinish: DateTime.tryParse(json["date_finish"] ?? ""),
      productoId: json["producto_id"] ?? 0,
      product: json["product"] ?? "",
      quantity: json["quantity"] ?? "",
      locations: json["locations"] == null
          ? []
          : List<Location>.from(
              json["locations"]!.map((x) => Location.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "truck_name": truckName,
        "truck_identity": truckIdentity,
        "truck_description": truckDescription,
        "status": status,
        "date_start": dateStart?.toIso8601String(),
        "date_finish": dateFinish?.toIso8601String(),
        "producto_id": productoId,
        "product": product,
        "quantity": quantity,
        "locations": locations.map((x) => x?.toJson()).toList(),
      };

  @override
  String toString() {
    return "$id, $name, $truckName, $truckIdentity, $truckDescription, $status, $dateStart, $dateFinish, $productoId, $product, $quantity, $locations, ";
  }
}

class Location {
  Location({
    required this.id,
    required this.description,
    required this.type,
    required this.routeId,
    required this.dateTime,
    required this.name,
    required this.status,
  });

  final int id;
  final String description;
  final String type;
  final int routeId;
  final dynamic dateTime;
  final String name;
  final int status;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json["id"] ?? 0,
      description: json["description"] ?? "",
      type: json["type"] ?? "",
      routeId: json["route_id"] ?? 0,
      dateTime: json["date_time"],
      name: json["name"] ?? "",
      status: json["status"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "type": type,
        "route_id": routeId,
        "date_time": dateTime,
        "name": name,
        "status": status,
      };

  @override
  String toString() {
    return "$id, $description, $type, $routeId, $dateTime, $name, $status, ";
  }
}

class User {
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.avatar,
    required this.role,
    required this.companyId,
  });

  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  String avatar;
  final String role;
  final dynamic companyId;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      username: json["username"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",
      avatar: json["avatar"] ?? "",
      role: json["role"] ?? "",
      companyId: json["company_id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "phone": phone,
        "avatar": avatar,
        "role": role,
        "company_id": companyId,
      };

  @override
  String toString() {
    return "$id, $name, $username, $email, $phone, $avatar, $role, $companyId, ";
  }
}
