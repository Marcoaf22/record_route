class UserProfile {
  UserProfile({
    required this.user,
    required this.driver,
    required this.companies,
    required this.factories,
    required this.products,
    required this.routes,
    required this.routeActive,
    required this.accessToken,
    required this.tokenType,
  });

  final User? user;
  final Driver? driver;
  final List<Company> companies;
  final List<Company> factories;
  final List<Product> products;
  final List<Route> routes;
  final Route? routeActive;
  final String? accessToken;
  final String? tokenType;

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
      accessToken: json["accessToken"],
      tokenType: json["token_type"],
    );
  }

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "driver": driver?.toJson(),
        "companies": companies.map((x) => x?.toJson()).toList(),
        "factories": factories.map((x) => x?.toJson()).toList(),
        "products": products.map((x) => x?.toJson()).toList(),
        "routes": routes.map((x) => x?.toJson()).toList(),
        "route_active": routeActive?.toJson(),
        "accessToken": accessToken,
        "token_type": tokenType,
      };

  @override
  String toString() {
    return "$user, $driver, $companies, $factories, $products, $routes, $routeActive, $accessToken, $tokenType, ";
  }
}

class Company {
  Company({
    required this.id,
    required this.name,
    required this.nit,
    required this.address,
    required this.email,
    required this.phone,
  });

  final int? id;
  final String? name;
  final String? nit;
  final String? address;
  final String? email;
  final String? phone;
  int index = -1;
  bool selected = false;

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json["id"],
      name: json["name"],
      nit: json["nit"],
      address: json["address"],
      email: json["email"],
      phone: json["phone"],
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

  final int? id;
  final String? name;
  final String? lastName;
  final DateTime? birthDate;
  final String? identityCard;
  final String? identityCardExt;
  final String? driverLicense;
  final String? driverLicenseCategory;
  final DateTime? driverLicenseExpiration;
  final String? truckIdentity;
  final String? truckDescription;
  final String? truckCapacity;

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json["id"],
      name: json["name"],
      lastName: json["last_name"],
      birthDate: DateTime.tryParse(json["birth_date"] ?? ""),
      identityCard: json["identity_card"],
      identityCardExt: json["identity_card_ext"],
      driverLicense: json["driver_license"],
      driverLicenseCategory: json["driver_license_category"],
      driverLicenseExpiration:
          DateTime.tryParse(json["driver_license_expiration"] ?? ""),
      truckIdentity: json["truck_identity"],
      truckDescription: json["truck_description"],
      truckCapacity: json["truck_capacity"],
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

  final int? productoId;
  final String? description;
  final String? descriptionShort;
  final String? measureUnit;
  final String? color;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productoId: json["producto_id"],
      description: json["description"],
      descriptionShort: json["description_short"],
      measureUnit: json["measure_unit"],
      color: json["color"],
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
    required this.truckIdentity,
    required this.truckDescription,
    required this.status,
    required this.dateStart,
    required this.dateFinish,
    required this.product,
    required this.quantity,
    required this.locations,
  });

  final int? id;
  final String? name;
  final String? truckIdentity;
  final String? truckDescription;
  final String? status;
  final DateTime? dateStart;
  final dynamic dateFinish;
  final String? product;
  final String? quantity;
  final List<Location> locations;

  factory Route.fromJson(Map<String, dynamic> json) {
    return Route(
      id: json["id"],
      name: json["name"],
      truckIdentity: json["truck_identity"],
      truckDescription: json["truck_description"],
      status: json["status"],
      dateStart: DateTime.tryParse(json["date_start"] ?? ""),
      dateFinish: json["date_finish"],
      product: json["product"],
      quantity: json["quantity"],
      locations: json["locations"] == null
          ? []
          : List<Location>.from(
              json["locations"]!.map((x) => Location.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "truck_identity": truckIdentity,
        "truck_description": truckDescription,
        "status": status,
        "date_start": dateStart?.toIso8601String(),
        "date_finish": dateFinish,
        "product": product,
        "quantity": quantity,
        "locations": locations.map((x) => x?.toJson()).toList(),
      };

  @override
  String toString() {
    return "$id, $name, $truckIdentity, $truckDescription, $status, $dateStart, $dateFinish, $product, $quantity, $locations, ";
  }
}

class Location {
  Location({
    required this.id,
    required this.position,
    required this.description,
    required this.type,
    required this.status,
    required this.routeId,
    required this.companyId,
    required this.dateTime,
    required this.deletedAt,
  });

  final int? id;
  final dynamic position;
  final dynamic description;
  final String? type;
  final int? status;
  final int? routeId;
  final int? companyId;
  final dynamic dateTime;
  final dynamic deletedAt;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json["id"],
      position: json["position"],
      description: json["description"],
      type: json["type"],
      status: json["status"],
      routeId: json["route_id"],
      companyId: json["company_id"],
      dateTime: json["date_time"],
      deletedAt: json["deleted_at"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "position": position,
        "description": description,
        "type": type,
        "status": status,
        "route_id": routeId,
        "company_id": companyId,
        "date_time": dateTime,
        "deleted_at": deletedAt,
      };

  @override
  String toString() {
    return "$id, $position, $description, $type, $status, $routeId, $companyId, $dateTime, $deletedAt, ";
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

  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final String? phone;
  final String? avatar;
  final String? role;
  final dynamic companyId;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      email: json["email"],
      phone: json["phone"],
      avatar: json["avatar"],
      role: json["role"],
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
