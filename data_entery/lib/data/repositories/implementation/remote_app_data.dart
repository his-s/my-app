import 'dart:developer';

import 'package:data_entery/data/database/database.dart' as d;
import 'package:data_entery/data/models/articles_model.dart';
import 'package:data_entery/data/repositories/interfaces/app_data_inferface.dart';
import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteAppData implements AppDataInterface {
  final Supabase _supabase;

  RemoteAppData(this._supabase, this.appDatabase);
  List<Article> _articles = [];
  List<Category> _categories = [];
  List<Section> _sections = [];
  List<Section> get sections => _sections;
  List<Category> get categories => _categories;
  List<Article> get articles => _articles;
  final d.AppDatabase appDatabase;
  @override
  Future<List<Article>> getArticles() async {
    log('U are now asking from remote Data');
    try {
      if (_articles.isEmpty) {
        List<Map<String, dynamic>> data = await _supabase.client
            .from('articles')
            .select('*,categories(*,sections(*,subsections(*)))');
        _articles = data.map((e) => Article.fromMap(e)).toList();

        return _articles;
      } else {
        return _articles;
      }
    } catch (e) {
      log(e.toString());
    }
    return _articles;
  }

  @override
  Future<List<Category>> getCategories() async {
    try {
      if (_articles.isEmpty) {
        List<Map<String, dynamic>> data =
            await _supabase.client.from('categories').select('*');
        _categories = data.map((e) => Category.fromMap(e)).toList();
        _categories.forEach((element) async {
          await appDatabase.into(appDatabase.categories).insert(
                d.CategoriesCompanion.insert(
                  id: _articles.first.id,
                  title: _articles.first.title,
                  orderId: Value(articles.first.orderId),
                  premium: Value(articles.first.premium),
                  createdAt: Value(articles.first.createdAt),
                  articleId: articles.first.id,
                ),
              );
        });

        return _categories;
      } else {
        return _categories;
      }
    } catch (e) {
      log(e.toString());
    }
    return _categories;
  }

  @override
  Future<List<Section>> getSections() {
    // TODO: implement getSections
    throw UnimplementedError();
  }
}
