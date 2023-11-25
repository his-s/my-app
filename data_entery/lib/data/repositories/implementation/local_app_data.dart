import 'package:data_entery/data/models/articles_model.dart';
import 'package:data_entery/data/repositories/interfaces/app_data_inferface.dart';

class LocalAppData implements AppDataInterface {
  @override
  Future<List<Article>> getArticles() {}

  @override
  Future<List<Category>> getCategories() {}

  @override
  Future<List<Section>> getSections() {}
}
