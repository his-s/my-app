import 'package:data_entery/data/models/articles_model.dart';

abstract class AppDataInterface {
  Future<List<Article>> getArticles();
  Future<List<Category>> getCategories();
  Future<List<Section>> getSections();
}
