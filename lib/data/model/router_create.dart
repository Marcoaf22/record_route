import 'package:record_route/util/utils.dart';

class RouterCreate {
  RouterCreate({
    required this.name,
    required this.dateStart,
    required this.driverId,
    required this.productoId,
    required this.quantity,
    required this.factoryId,
    required this.companies,
  });

  String name;
  DateTime? dateStart;
  int driverId;
  int productoId;
  int quantity;
  int factoryId;
  List<CompanyId> companies;

  factory RouterCreate.fromJson(Map<String, dynamic> json) {
    return RouterCreate(
      name: json["name"] ?? "",
      dateStart: DateTime.tryParse(json["date_start"] ?? ""),
      driverId: json["driver_id"] ?? 0,
      productoId: json["producto_id"] ?? 0,
      quantity: json["quantity"] ?? 0,
      factoryId: json["factory_id"] ?? 0,
      companies: json["companies"] == null
          ? []
          : List<CompanyId>.from(
              json["companies"]!.map((x) => CompanyId.fromJson(x))),
    );
  }

  factory RouterCreate.empty() => RouterCreate.fromJson({});

  Map<String, dynamic> toJson() => {
        "name": name,
        "date_start": dateStart != null ? removeMillisecondsFromDateTime(dateStart!.toIso8601String()) : '',
        "driver_id": driverId,
        "producto_id": productoId,
        "quantity": quantity,
        "factory_id": factoryId,
        "companies": companies.map((x) => x?.toJson()).toList(),
      };

  @override
  String toString() {
    return "$name, $dateStart, $driverId, $productoId, $quantity, $factoryId, $companies, ";
  }
}

class CompanyId {
  CompanyId({
    required this.id,
  });

  final int id;

  factory CompanyId.fromJson(Map<String, dynamic> json) {
    return CompanyId(
      id: json["id"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
      };

  @override
  String toString() {
    return "$id, ";
  }
}
