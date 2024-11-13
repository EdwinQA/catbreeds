import 'package:catbreeds/domain/domains_chest.dart';

abstract class CatRepository {
  Future<List<Cat>> getListCats({int page = 1});
}
