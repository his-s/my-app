import 'dart:developer';

import 'package:data_entery/data/models/articles_model.dart';
import 'package:data_entery/data/repositories/interfaces/app_data_inferface.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteAppData implements AppDataInterface {
  final Supabase _supabase;

  RemoteAppData(this._supabase);
  List<Article> _articles = [];
  List<Category> _categories = [];
  List<Section> _sections = [];
  List<Section> get sections => _sections;
  List<Category> get categories => _categories;
  List<Article> get articles => _articles;
  @override
  Future<List<Article>> getArticles() async {
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
  List<Category> getCategories() {
    // i will for loop insted of request data again from sever may be will be worse when data become bigger
    for (var element in _articles) {
      _categories = [..._categories, ...element.categories];
    }
    return _categories;
  }

  @override
  List<Section> getSections() {
    // also for sections
    for (var article in _articles) {
      for (var category in article.categories) {
        _sections = [..._sections, ...category.sections];
      }
    }
    return _sections;
  }
}
