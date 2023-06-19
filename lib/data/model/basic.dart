class Basic {
  Basic({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  Basic copyWith({
    int? id,
    String? name,
  }) {
    return Basic(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  factory Basic.fromJson(Map<String, dynamic> json) {
    return Basic(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class BasicSelected {
  final int id;
  final String name;
  bool selected = false;
  int index = 0;

  BasicSelected({
    required this.id,
    required this.name,
    this.selected = false,
    this.index = 0,
  });

  factory BasicSelected.fromJson(Map<String, dynamic> json) {
    return BasicSelected(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        selected: json["selected"] ?? "",
        index: json["index"] ?? "");
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "selected": selected,
        "index": index,
      };
}

List<Basic> fuelPlants = [
  Basic(id: 1, name: 'Planta cotoca'),
  Basic(id: 1, name: 'YPFB Palmasola.'),
  Basic(id: 1, name: 'Discar'),
  Basic(id: 1, name: 'Alcasa'),
  Basic(id: 1, name: 'YPFB Puerto Suares.'),
];

List<BasicSelected> gasStations = [
  BasicSelected(id: 1, name: 'EESS Guayacan'),
  BasicSelected(id: 1, name: 'EESS Pampa.'),
  BasicSelected(id: 1, name: 'EESS Cotoca'),
  BasicSelected(id: 1, name: 'EESS La colorada.'),
  BasicSelected(id: 1, name: 'EESS Banzer 6 anillo'),
];
