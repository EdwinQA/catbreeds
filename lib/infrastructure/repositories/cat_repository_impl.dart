import 'package:catbreeds/domain/domains_chest.dart';

class CatRepositoryImpl extends CatsRepository {
  final CatsDatasource datasource;

  CatRepositoryImpl(this.datasource);

  @override
  Future<List<Cat>> getListBreedsCats() {
    return datasource.getListBreedsCats();
  }
}
