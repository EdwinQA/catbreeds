List<CatCatapidb> catCatapidbFromJson(List<dynamic> jsonData) {
  return jsonData.map((x) => CatCatapidb.fromJson(x)).toList();
}

class CatCatapidb {
  final String id;
  final String name;
  final String origin;
  final String description;
  final int adaptability;
  final int intelligence;
  final int energyLevel;
  final String image;

  CatCatapidb({
    required this.id,
    required this.name,
    required this.origin,
    required this.description,
    required this.adaptability,
    required this.intelligence,
    required this.energyLevel,
    required this.image,
  });

  factory CatCatapidb.fromJson(Map<String, dynamic> json) => CatCatapidb(
        id: json["image"] != null && json["image"]["id"] != ''
            ? json["image"]["id"]
            : 'no-id',
        name: json["name"],
        origin: json["origin"],
        description: json["description"],
        adaptability: json["adaptability"],
        intelligence: json["intelligence"],
        energyLevel: json["energy_level"],
        image: json["image"] != null && json["image"]["url"] != ''
            ? json["image"]["url"]
            : 'https://img.freepik.com/vector-premium/icono-gato_609277-3779.jpg',
      );
}
