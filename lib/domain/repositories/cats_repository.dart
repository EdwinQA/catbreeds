import 'package:catbreeds/domain/domains_chest.dart';

abstract class CatsRepository {
  Future<List<Cat>> getListBreedsCats();
}
