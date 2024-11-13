import 'package:catbreeds/domain/domains_chest.dart';

abstract class CatsDatasource {
  Future<List<Cat>> getListBreedsCats();
}
