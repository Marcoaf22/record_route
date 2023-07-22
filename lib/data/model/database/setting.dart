import 'package:record_route/core/utils/database.dart';
import 'package:record_route/data/model/auth/setting.dart';
import 'package:record_route/util/utils.dart';
import 'package:sqflite/sqflite.dart';

class RowSetting {
  RowSetting({this.darkMode = 0, this.onRecord = 0, this.stepIndex = 0});

  int stepIndex;
  int onRecord;
  int darkMode = 0;

  factory RowSetting.fromJson(Map<String, dynamic> json) {
    return RowSetting(
      darkMode: json["dark_mode"] ?? 0,
      onRecord: json["on_record"] ?? 0,
      stepIndex: json["step_index"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "step_index": stepIndex,
        "dark_mode": darkMode,
        "on_record": onRecord,
      };

  @override
  String toString() {
    return "$stepIndex, $darkMode, $onRecord";
  }
}

class RowSettingDB {
  static const table = "setting";
  late Database db;

  Future open() async {
    db = await DataBaseInventory.openDB();
  }

  Future<RowSetting> insert(RowSetting setting) async {
    await db.insert(table, setting.toJson());
    return setting;
  }

  Future<int> updateStep(Seeting setting) async {
    return await db.update(table, {"step_index": setting.stepIndex});
  }

  Future<int> count() async {
    final List<Map<String, dynamic>> list = await db.query(table);
    return list.length;
  }

  Future<Seeting> getSetting() async {
    final List<Map<String, dynamic>> list = await db.query(table);
    if (list.isNotEmpty) {
      final item = list.first;
      return Seeting(
          stepIndex: item['step_index'], darkMode: false, onRecord: false);
    }
    return Seeting(stepIndex: 0, darkMode: false, onRecord: false);
  }

  Future close() async => db.close();
}
