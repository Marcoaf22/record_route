import 'package:record_route/data/model/basic.dart';
import 'package:record_route/data/model/user_profile.dart';

class Seeting {
  bool darkMode = false;
  bool onRecord = false;
  int stepIndex = -1;
  List<Company> stations = [];
  Company? fuelPlant;
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
            : List<Company>.from(
                json["stations"].map((x) => Company.fromJson(x))),
        fuelPlant: json["fuelPlant"] == null
            ? null
            : Company.fromJson(json['fuelPlant']));
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
