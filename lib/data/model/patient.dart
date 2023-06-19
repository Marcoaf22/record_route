class Patient {
  Patient({
    required this.id,
    required this.person,
    required this.deceased,
    required this.admissionDate,
    required this.identifierAssigner,
    required this.names,
    required this.firstName,
    required this.lastName,
    required this.marriedName,
    required this.contactName,
    required this.customerTypeId,
    required this.insurance,
    required this.contactId,
    required this.sanguineGroupId,
    required this.insuranceName,
    required this.insuranceShortName,
    required this.insuranceCode,
    required this.maritalStatus,
    required this.contactType,
    required this.hcId,
    required this.businessUnit,
    required this.businessUnitId,
    required this.area,
    required this.areaId,
    required this.warehouseId,
    required this.hcCode,
    required this.allergies,
  });

  final int id;
  final Person? person;
  final bool deceased;
  final DateTime admissionDate;
  final String identifierAssigner;
  final String names;
  final String firstName;
  final String lastName;
  final String marriedName;
  final String contactName;
  final int customerTypeId;
  final int insurance;
  final int contactId;
  final int sanguineGroupId;
  final String insuranceName;
  final String insuranceShortName;
  final String insuranceCode;
  final String maritalStatus;
  final String contactType;
  final int hcId;
  final String businessUnit;
  final int businessUnitId;
  final String area;
  final int areaId;
  final int warehouseId;
  final String hcCode;
  final List<dynamic> allergies;

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json["id"] ?? 0,
      person: json["person"] == null ? null : Person.fromJson(json["person"]),
      deceased: json["deceased"] ?? false,
      // admissionDate: json["admissionDate"] ?? 0,
      admissionDate:
          DateTime.fromMillisecondsSinceEpoch(json["admissionDate"] ?? 0),
      identifierAssigner: json["identifierAssigner"] ?? "",
      names: json["names"] ?? "",
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
      marriedName: json["marriedName"] ?? "",
      contactName: json["contactName"] ?? "",
      customerTypeId: json["customerTypeId"] ?? 0,
      insurance: json["insurance"] ?? 0,
      contactId: json["contactId"] ?? 0,
      sanguineGroupId: json["sanguineGroupId"] ?? 0,
      insuranceName: json["insuranceName"] ?? "",
      insuranceShortName: json["insuranceShortName"] ?? "",
      insuranceCode: json["insuranceCode"] ?? "",
      maritalStatus: json["maritalStatus"] ?? "",
      contactType: json["contactType"] ?? "",
      hcId: json["hcId"] ?? 0,
      businessUnit: json["businessUnit"] ?? "",
      businessUnitId: json["businessUnitId"] ?? 0,
      area: json["area"] ?? "",
      areaId: json["areaId"] ?? 0,
      warehouseId: json["warehouseId"] ?? 0,
      hcCode: json["hcCode"] ?? "",
      allergies: json["allergies"] == null
          ? []
          : List<dynamic>.from(json["allergies"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "person": person?.toJson(),
        "deceased": deceased,
        "admissionDate": admissionDate.millisecond,
        "identifierAssigner": identifierAssigner,
        "names": names,
        "firstName": firstName,
        "lastName": lastName,
        "marriedName": marriedName,
        "contactName": contactName,
        "customerTypeId": customerTypeId,
        "insurance": insurance,
        "contactId": contactId,
        "sanguineGroupId": sanguineGroupId,
        "insuranceName": insuranceName,
        "insuranceShortName": insuranceShortName,
        "insuranceCode": insuranceCode,
        "maritalStatus": maritalStatus,
        "contactType": contactType,
        "hcId": hcId,
        "businessUnit": businessUnit,
        "businessUnitId": businessUnitId,
        "area": area,
        "areaId": areaId,
        "warehouseId": warehouseId,
        "hcCode": hcCode,
        "allergies": List<dynamic>.from(allergies.map((x) => x)),
      };
}

class Person {
  Person({
    required this.id,
    required this.typeId,
    required this.nit,
    required this.identityCard,
    required this.extensionIdentityCard,
    required this.name,
    required this.email,
    required this.city,
    required this.secondPhone,
    required this.firstPhone,
    required this.thirdPhone,
    required this.birthDate,
    required this.identityCardType,
    required this.gender,
    required this.countryId,
    required this.filterId,
    required this.countryName,
    required this.userId,
    required this.activityId,
    required this.userName,
    required this.invoiceName,
    required this.code,
    required this.occupation,
    required this.imagePath,
    required this.image64,
  });

  final int id;
  final int typeId;
  final String nit;
  final String identityCard;
  final String extensionIdentityCard;
  final String name;
  final String email;
  final String city;
  final String secondPhone;
  final String firstPhone;
  final String thirdPhone;
  final DateTime birthDate;
  final String identityCardType;
  final String gender;
  final int countryId;
  final int filterId;
  final String countryName;
  final int userId;
  final int activityId;
  final String userName;
  final String invoiceName;
  final String code;
  final String occupation;
  final String imagePath;
  final String image64;

  Person copyWith({
    int? id,
    int? typeId,
    String? nit,
    String? identityCard,
    String? extensionIdentityCard,
    String? name,
    String? email,
    String? city,
    String? secondPhone,
    String? firstPhone,
    String? thirdPhone,
    DateTime? birthDate,
    String? identityCardType,
    String? gender,
    int? countryId,
    int? filterId,
    String? countryName,
    int? userId,
    int? activityId,
    String? userName,
    String? invoiceName,
    String? code,
    String? occupation,
    String? imagePath,
    String? image64,
  }) {
    return Person(
      id: id ?? this.id,
      typeId: typeId ?? this.typeId,
      nit: nit ?? this.nit,
      identityCard: identityCard ?? this.identityCard,
      extensionIdentityCard:
          extensionIdentityCard ?? this.extensionIdentityCard,
      name: name ?? this.name,
      email: email ?? this.email,
      city: city ?? this.city,
      secondPhone: secondPhone ?? this.secondPhone,
      firstPhone: firstPhone ?? this.firstPhone,
      thirdPhone: thirdPhone ?? this.thirdPhone,
      birthDate: birthDate ?? this.birthDate,
      identityCardType: identityCardType ?? this.identityCardType,
      gender: gender ?? this.gender,
      countryId: countryId ?? this.countryId,
      filterId: filterId ?? this.filterId,
      countryName: countryName ?? this.countryName,
      userId: userId ?? this.userId,
      activityId: activityId ?? this.activityId,
      userName: userName ?? this.userName,
      invoiceName: invoiceName ?? this.invoiceName,
      code: code ?? this.code,
      occupation: occupation ?? this.occupation,
      imagePath: imagePath ?? this.imagePath,
      image64: image64 ?? this.image64,
    );
  }

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json["id"] ?? 0,
      typeId: json["typeId"] ?? 0,
      nit: json["nit"] ?? "",
      identityCard: json["identityCard"] ?? "",
      extensionIdentityCard: json["extension"] ?? "",
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      city: json["city"] ?? "",
      secondPhone: json["secondPhone"] ?? "",
      firstPhone: json["firstPhone"] ?? "",
      thirdPhone: json["thirdPhone"] ?? "",
      birthDate: DateTime.fromMillisecondsSinceEpoch(json['birthDate'] ?? 0),
      // birthDate: json["birthDate"] ?? 0,
      identityCardType: json["identityCardType"] ?? "",
      gender: json["gender"] ?? "",
      countryId: json["countryId"] ?? 0,
      filterId: json["filterId"] ?? 0,
      countryName: json["countryName"] ?? "",
      userId: json["userId"] ?? 0,
      activityId: json["activityId"] ?? 0,
      userName: json["userName"] ?? "",
      invoiceName: json["invoiceName"] ?? "",
      code: json["code"] ?? "",
      occupation: json["occupation"] ?? "",
      imagePath: json["imagePath"] ?? "",
      image64: json["image64"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "typeId": typeId,
        "nit": nit,
        "identityCard": identityCard,
        "extensionIdentityCard": extensionIdentityCard,
        "name": name,
        "email": email,
        "city": city,
        "secondPhone": secondPhone,
        "firstPhone": firstPhone,
        "thirdPhone": thirdPhone,
        "birthDate": birthDate,
        "identityCardType": identityCardType,
        "gender": gender,
        "countryId": countryId,
        "filterId": filterId,
        "countryName": countryName,
        "userId": userId,
        "activityId": activityId,
        "userName": userName,
        "invoiceName": invoiceName,
        "code": code,
        "occupation": occupation,
        "imagePath": imagePath,
        "image64": image64,
      };
}
