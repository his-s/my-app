import 'dart:developer';

import 'package:data_entery/data/database/database.dart' as d;
import 'package:data_entery/data/models/articles_model.dart';
import 'package:data_entery/data/repositories/interfaces/app_data_inferface.dart';

class LocalAppDataSource implements AppDataInterface {
  final d.AppDatabase database;
  List<Article> _articles = [];
  List<Category> _categories = [];
  List<Section> _sections = [];
  List<Subsection> _subsections = [];

  LocalAppDataSource(this.database);

  List<Section> get sections => _sections;
  List<Category> get categories => _categories;
  List<Article> get articles => _articles;

  @override
  Future<List<Article>> getArticles() async {
    try {
      List<d.Article> allItems = await _fetchArticlesFromDatabase();
      log(allItems.toString());
      _articles = allItems
          .map((e) => Article(
              id: e.id,
              title: e.title,
              premium: e.premium,
              orderId: 0,
              authorName: e.authorName ?? '',
              categories: categories))
          .toList();
      return [..._articles];
    } catch (e) {
      log('Error fetching articles: $e');
      return [];
    }
  }

  Future<List<d.Article>> _fetchArticlesFromDatabase() async {
    return await database.select(database.articles).get();
  }

  @override
  Future<List<Category>> getCategories() async {
    try {
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
      return _categories;
    } catch (e) {
      log('Error fetching categories: $e');
      return [];
    }
  }

  @override
  Future<List<Section>> getSections() async {
    try {
      List<d.Section> sec = await database.select(database.sections).get();
      _sections = sec
          .map(
            (e) => Section(
                id: e.id,
                createdAt: e.createdAt,
                title: e.title,
                articleId: e.articleId,
                orderId: e.orderId,
                categoryId: e.categoryId,
                premium: e.premium,
                subsections: []),
          )
          .toList();
      return _sections;
    } catch (e) {
      log('Error fetching sections: $e');
      return [];
    }
  }

  @override
  Future<List<Subsection>> getSubsections() async {
    try {
      List<d.Subsection> sec =
          await database.select(database.subsections).get();
      _subsections = sec
          .map(
            (e) => Subsection(
              id: e.id,
              createdAt: e.createdAt,
              title: e.title,
              articleId: e.articleId,
              orderId: e.orderId,
              categoryId: e.categoryId,
              data: '',
              sectionId: e.sectionId,
            ),
          )
          .toList();
      return _subsections;
    } catch (e) {
      log('Error fetching subsections: $e');
      return [];
    }
  }
}
