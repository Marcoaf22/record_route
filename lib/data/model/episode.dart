class Episode {
  Episode({
    required this.hcId,
    required this.professionalId,
    required this.businessId,
    required this.hcCode,
    required this.startDate,
    required this.startHour,
    required this.businessUnit,
    required this.area,
    required this.unit,
    required this.professional,
    required this.reason,
    required this.status,
    required this.type,
    required this.typeId,
    required this.validation,
    required this.patient,
    required this.saleId,
    required this.userAdmission,
    required this.accountId,
    required this.endDate,
    required this.endHour,
  });

  final int hcId;
  final int professionalId;
  final int businessId;
  final String hcCode;
  final DateTime? startDate;
  final String startHour;
  final String businessUnit;
  final String area;
  final String unit;
  final String professional;
  final String reason;
  final String status;
  final String type;
  final String typeId;
  final String validation;
  final String patient;
  final int saleId;
  final String userAdmission;
  final int accountId;
  final int endDate;
  final String endHour;

  Episode copyWith({
    int? hcId,
    int? professionalId,
    int? businessId,
    String? hcCode,
    DateTime? startDate,
    String? startHour,
    String? businessUnit,
    String? area,
    String? unit,
    String? professional,
    String? reason,
    String? status,
    String? type,
    String? typeId,
    String? validation,
    String? patient,
    int? saleId,
    String? userAdmission,
    int? accountId,
    int? endDate,
    String? endHour,
  }) {
    return Episode(
      hcId: hcId ?? this.hcId,
      professionalId: professionalId ?? this.professionalId,
      businessId: businessId ?? this.businessId,
      hcCode: hcCode ?? this.hcCode,
      startDate: startDate ?? this.startDate,
      startHour: startHour ?? this.startHour,
      businessUnit: businessUnit ?? this.businessUnit,
      area: area ?? this.area,
      unit: unit ?? this.unit,
      professional: professional ?? this.professional,
      reason: reason ?? this.reason,
      status: status ?? this.status,
      type: type ?? this.type,
      typeId: typeId ?? this.typeId,
      validation: validation ?? this.validation,
      patient: patient ?? this.patient,
      saleId: saleId ?? this.saleId,
      userAdmission: userAdmission ?? this.userAdmission,
      accountId: accountId ?? this.accountId,
      endDate: endDate ?? this.endDate,
      endHour: endHour ?? this.endHour,
    );
  }

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      hcId: json["hcId"] ?? 0,
      professionalId: json["professionalId"] ?? 0,
      businessId: json["businessId"] ?? 0,
      hcCode: json["hcCode"] ?? "",
      startDate: json['startDate'] != null ? DateTime.fromMillisecondsSinceEpoch(json["startDate"]): null,
      startHour: json["startHour"] ?? "",
      businessUnit: json["businessUnit"] ?? "",
      area: json["area"] ?? "",
      unit: json["unit"] ?? "",
      professional: json["professional"] ?? "",
      reason: json["reason"] ?? "",
      status: json["status"] ?? "",
      type: json["type"] ?? "",
      typeId: json["typeId"] ?? "",
      validation: json["validation"] ?? "",
      patient: json["patient"] ?? "",
      saleId: json["saleId"] ?? 0,
      userAdmission: json["userAdmission"] ?? "",
      accountId: json["accountId"] ?? 0,
      endDate: json["endDate"] ?? 0,
      endHour: json["endHour"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "hcId": hcId,
        "professionalId": professionalId,
        "businessId": businessId,
        "hcCode": hcCode,
        "startDate": startDate,
        "startHour": startHour,
        "businessUnit": businessUnit,
        "area": area,
        "unit": unit,
        "professional": professional,
        "reason": reason,
        "status": status,
        "type": type,
        "typeId": typeId,
        "validation": validation,
        "patient": patient,
        "saleId": saleId,
        "userAdmission": userAdmission,
        "accountId": accountId,
        "endDate": endDate,
        "endHour": endHour,
      };
}
