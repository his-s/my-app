import 'dart:developer';

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
    log('U are now asking from local Data');
    return Future.delayed(const Duration(milliseconds: 1)).then((value) => [
          Article(
            id: 'id',
            title: 'title',
            premium: true,
            orderId: 0,
            authorName: 'authorName',
            categories: categories,
          ),
        ]);
  }

  @override
  List<Category> getCategories() {
    return categories;
  }

  @override
  List<Section> getSections() {
    return sections;
  }
}
