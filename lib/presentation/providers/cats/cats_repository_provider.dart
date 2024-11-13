import 'package:catbreeds/infrastructure/infrastructure_chest.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return CatRepositoryImpl(CatapidbDatasource());
});
