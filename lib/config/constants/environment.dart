import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theCatApiKey = dotenv.env['THECATAPI_KEY'] ?? 'No hay API_Key';
}
