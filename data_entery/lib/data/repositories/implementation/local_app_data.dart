import 'package:data_entery/data/models/articles_model.dart';
import 'package:data_entery/data/repositories/interfaces/app_data_inferface.dart';

class LocalAppData implements AppDataInterface {
  List<Article> _articles = [];
  List<Category> _categories = [];
  List<Section> _sections = [];
  List<Section> get sections => _sections;
  List<Category> get categories => _categories;
  List<Article> get articles => _articles;
  @override
  Future<List<Article>> getArticles() {
    // TODO: implement getArticles
    throw UnimplementedError();
  }

  @override
  List<Category> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  List<Section> getSections() {
    // TODO: implement getSections
    throw UnimplementedError();
  }
}
