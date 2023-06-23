import 'package:record_route/core/utils/database.dart';
import 'package:sqflite/sqflite.dart';

class RowLocation {
  RowLocation({
    this.id,
    required this.latitude,
    required this.longitude,
    required this.routeId,
    required this.dateTime,
  });

  int? id;
  String latitude;
  String longitude;
  int routeId;
  DateTime? dateTime;

  factory RowLocation.fromJson(Map<String, dynamic> json) {
    return RowLocation(
      id: json["id"] ?? 0,
      latitude: json["latitude"] ?? "",
      longitude: json["longitude"] ?? "",
      routeId: json["route_id"] ?? 0,
      dateTime: DateTime.tryParse(json["date_time"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "latitude": latitude,
        "longitude": longitude,
        "route_id": routeId,
        "date_time": dateTime?.toIso8601String(),
      };

  @override
  String toString() {
    return "$id, $latitude, $longitude, $routeId, $dateTime, ";
  }
}

class RowLocationDB {
  static const table = "locations";
  late Database db;

  Future open() async {
    db = await DataBaseInventory.openDB();
  }

  Future<RowLocation> insert(RowLocation location) async {
    location.id = await db.insert(table, location.toJson());
    print('insertando: ' + location.id.toString() + " - " + location.latitude);
    return location;
  }

  Future<RowLocation?> find(int routerId) async {
    List<Map> res = await db.query(table,
        columns: null, where: 'router_id = ?', whereArgs: [routerId]);
    return res.isNotEmpty
        ? RowLocation.fromJson(res.first as Map<String, dynamic>)
        : null;
  }

  Future<int> delete(int id) async {
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(RowLocation b) async {
    return await db
        .update(table, b.toJson(), where: 'id = ?', whereArgs: [b.id]);
  }

  Future<List<RowLocation>> getAll() async {
    final List<Map<String, dynamic>> list = await db.query(table);
    return List.generate(
      list.length,
      (i) => RowLocation(
        id: list[i]['id'],
        latitude: list[i]['latitude'],
        longitude: list[i]['longitude'],
        routeId: list[i]['route_id'],
        dateTime: DateTime.now(),
      ),
    );
  }

  Future close() async => db.close();
}
