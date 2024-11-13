import 'package:catbreeds/config/constants/environment.dart';
import 'package:catbreeds/domain/domains_chest.dart';
import 'package:catbreeds/infrastructure/infrastructure_chest.dart';
import 'package:dio/dio.dart';

class CatapidbDatasource extends CatsDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.thecatapi.com/v1/',
    queryParameters: {
      'api_key': Environment.theCatApiKey,
    },
  ));
  @override
  Future<List<Cat>> getListBreedsCats() async {
    final response = await dio.get('breeds');

    final List<Cat> cats = catCatapidbFromJson(response.data)
        .map((catdb) => CatMapper.catDBToEntity(catdb))
        .toList(); //;
    return cats;
  }
}
