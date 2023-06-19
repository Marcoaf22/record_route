class Service {
  Service(
      {required this.orderDetailId,
      required this.patientOrderId,
      required this.hcId,
      required this.patientId,
      required this.name,
      required this.hcCode,
      required this.professional,
      required this.date,
      required this.quantity,
      required this.itemId,
      required this.itemName,
      required this.observation,
      required this.priority,
      required this.status,
      required this.area,
      required this.location,
      required this.type,
      this.isActive = false});

  final int orderDetailId;
  final int patientOrderId;
  final int hcId;
  final int patientId;
  final String name;
  final String hcCode;
  final String professional;
  final DateTime date;
  final double quantity;
  final int itemId;
  final String itemName;
  final String observation;
  final String priority;
  final String status;
  final String area;
  final String location;
  final String type;
  bool isActive;

  Service copyWith(
      {int? orderDetailId,
      int? patientOrderId,
      int? hcId,
      int? patientId,
      String? name,
      String? hcCode,
      String? professional,
      DateTime? date,
      double? quantity,
      int? itemId,
      String? itemName,
      String? observation,
      String? priority,
      String? status,
      String? area,
      String? location,
      String? type,
      bool? isActive}) {
    return Service(
        orderDetailId: orderDetailId ?? this.orderDetailId,
        patientOrderId: patientOrderId ?? this.patientOrderId,
        hcId: hcId ?? this.hcId,
        patientId: patientId ?? this.patientId,
        name: name ?? this.name,
        hcCode: hcCode ?? this.hcCode,
        professional: professional ?? this.professional,
        date: date ?? this.date,
        quantity: quantity ?? this.quantity,
        itemId: itemId ?? this.itemId,
        itemName: itemName ?? this.itemName,
        observation: observation ?? this.observation,
        priority: priority ?? this.priority,
        status: status ?? this.status,
        area: area ?? this.area,
        location: location ?? this.location,
        type: type ?? this.type,
        isActive: isActive ?? this.isActive);
  }

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      orderDetailId: json["orderDetailId"] ?? 0,
      patientOrderId: json["patientOrderId"] ?? 0,
      hcId: json["hcId"] ?? 0,
      patientId: json["patientId"] ?? 0,
      name: json["name"] ?? "",
      hcCode: json["hcCode"] ?? "",
      professional: json["professional"] ?? "",
      date: DateTime.fromMillisecondsSinceEpoch(json["date"] ?? 0),
      quantity: json["quantity"] ?? 0,
      itemId: json["itemId"] ?? 0,
      itemName: json["itemName"] ?? "",
      observation: json["observation"] ?? "",
      priority: json["priority"] ?? "",
      status: json["status"] ?? "",
      area: json["area"] ?? "",
      location: json["location"] ?? "",
      type: json["type"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "orderDetailId": orderDetailId,
        "patientOrderId": patientOrderId,
        "hcId": hcId,
        "patientId": patientId,
        "name": name,
        "hcCode": hcCode,
        "professional": professional,
        "date": date,
        "quantity": quantity,
        "itemId": itemId,
        "itemName": itemName,
        "observation": observation,
        "priority": priority,
        "status": status,
        "area": area,
        "location": location,
        "type": type,
      };
}
