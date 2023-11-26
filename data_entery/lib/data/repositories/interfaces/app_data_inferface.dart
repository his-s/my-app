import 'package:data_entery/data/models/articles_model.dart';

abstract class AppDataInterface {
  Future<List<Article>> getArticles();
  List<Category> getCategories();
  List<Section> getSections();
}
