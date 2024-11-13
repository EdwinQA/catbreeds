import 'package:catbreeds/domain/domains_chest.dart';
import 'package:catbreeds/infrastructure/infrastructure_chest.dart';

class CatMapper {
  static Cat catDBToEntity(CatCatapidb catdb) => Cat(
      id: catdb.id,
      name: catdb.name,
      origin: catdb.origin,
      description: catdb.description,
      adaptability: catdb.adaptability,
      intelligence: catdb.intelligence,
      energyLevel: catdb.energyLevel,
      urlImg: catdb.image == ''
          ? 'https://img.freepik.com/vector-premium/icono-gato_609277-3779.jpg'
          : catdb.image);
}
