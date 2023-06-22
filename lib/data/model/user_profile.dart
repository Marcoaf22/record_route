class UserProfile {
  UserProfile({
    required this.user,
    required this.driver,
    required this.companies,
    required this.factories,
  });

  final User? user;
  final Driver? driver;
  final List<Company> companies;
  final List<Company> factories;

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
    );
  }

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "driver": driver?.toJson(),
        "companies": companies.map((x) => x?.toJson()).toList(),
        "factories": factories.map((x) => x?.toJson()).toList(),
      };

  @override
  String toString() {
    return "$user, $driver, $companies, $factories, ";
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
  final dynamic birthDate;
  final String? identityCard;
  final dynamic identityCardExt;
  final dynamic driverLicense;
  final dynamic driverLicenseCategory;
  final dynamic driverLicenseExpiration;
  final dynamic truckIdentity;
  final dynamic truckDescription;
  final dynamic truckCapacity;

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json["id"],
      name: json["name"],
      lastName: json["last_name"],
      birthDate: json["birth_date"],
      identityCard: json["identity_card"],
      identityCardExt: json["identity_card_ext"],
      driverLicense: json["driver_license"],
      driverLicenseCategory: json["driver_license_category"],
      driverLicenseExpiration: json["driver_license_expiration"],
      truckIdentity: json["truck_identity"],
      truckDescription: json["truck_description"],
      truckCapacity: json["truck_capacity"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "last_name": lastName,
        "birth_date": birthDate,
        "identity_card": identityCard,
        "identity_card_ext": identityCardExt,
        "driver_license": driverLicense,
        "driver_license_category": driverLicenseCategory,
        "driver_license_expiration": driverLicenseExpiration,
        "truck_identity": truckIdentity,
        "truck_description": truckDescription,
        "truck_capacity": truckCapacity,
      };

  @override
  String toString() {
    return "$id, $name, $lastName, $birthDate, $identityCard, $identityCardExt, $driverLicense, $driverLicenseCategory, $driverLicenseExpiration, $truckIdentity, $truckDescription, $truckCapacity, ";
  }
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatar,
    required this.role,
    required this.companyId,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? avatar;
  final String? role;
  final dynamic companyId;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
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
        "email": email,
        "phone": phone,
        "avatar": avatar,
        "role": role,
        "company_id": companyId,
      };

  @override
  String toString() {
    return "$id, $name, $email, $phone, $avatar, $role, $companyId, ";
  }
}
