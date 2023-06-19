import 'package:record_route/data/model/basic.dart';

class Seeting {
  bool darkMode = false;
  bool onRecord = false;
  int stepIndex = -1;
  List<BasicSelected> stations = [];
  Basic? fuelPlant;
  Seeting(
      {required this.darkMode,
      this.onRecord = false,
      this.stepIndex = -1,
      this.stations = const [],
      this.fuelPlant});

  factory Seeting.fromJson(Map<String, dynamic> json) {
    return Seeting(
        darkMode: json['darkMode'],
        onRecord: json['onRecord'] as bool,
        stepIndex: json['stepIndex'] as int,
        stations: json["stations"] == null
            ? []
            : List<BasicSelected>.from(
                json["stations"].map((x) => BasicSelected.fromJson(x))),
        fuelPlant: json["fuelPlant"] == null
            ? null
            : Basic.fromJson(json['fuelPlant']));
  }

  Map<String, dynamic> toJson() => {
        'darkMode': darkMode,
        'onRecord': onRecord,
        'stepIndex': stepIndex,
        'stations':
            List<Map<String, dynamic>>.from(stations.map((x) => x.toJson())),
        'fuelPlant': fuelPlant?.toJson(),
      };
}
