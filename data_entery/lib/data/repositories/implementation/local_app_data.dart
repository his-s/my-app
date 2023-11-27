import 'dart:developer';

import 'package:data_entery/data/database/database.dart' as d;
import 'package:data_entery/data/models/articles_model.dart';
import 'package:data_entery/data/repositories/interfaces/app_data_inferface.dart';

class LocalAppData implements AppDataInterface {
  List<Article> _articles = [];
  List<Category> _categories = [];
  List<Section> _sections = [];

  LocalAppData(this.database);
  List<Section> get sections => _sections;
  List<Category> get categories => _categories;
  List<Article> get articles => _articles;
  final d.AppDatabase database;
  @override
  Future<List<Article>> getArticles() async {
    List<d.Article> allItems = await database.select(database.articles).get();
    List<d.Categorie> cat = await database.select(database.categories).get();
    _categories = cat
        .map(
          (e) => Category(
              id: e.id,
              createdAt: e.createdAt,
              title: e.title,
              articleId: e.articleId,
              orderId: e.orderId ?? 0,
              sections: sections),
        )
        .toList();
    _articles = allItems
        .map((e) => Article(
            id: e.id,
            title: e.title,
            premium: e.premium,
            orderId: e.order ?? 0,
            authorName: e.authorName ?? '',
            categories: categories))
        .toList();
    return [..._articles];
  }

  @override
  Future<List<Category>> getCategories() async {
    return categories;
  }

  @override
  Future<List<Section>> getSections() async {
    return sections;
  }
}
