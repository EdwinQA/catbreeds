import 'package:catbreeds/domain/domains_chest.dart';

abstract class CatDatasource {
  Future<List<Cat>> getListCats({int page = 1});
}
