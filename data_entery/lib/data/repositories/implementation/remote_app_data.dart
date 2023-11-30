import 'dart:developer';
import 'package:data_entery/data/database/database.dart' as d;
import 'package:data_entery/data/models/articles_model.dart';
import 'package:data_entery/data/repositories/interfaces/app_data_inferface.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteAppDataSource implements AppDataInterface {
  final Supabase _supabase;
  final d.AppDatabase appDatabase;
  List<Article> _articles = [];
  List<Category> _categories = [];
  List<Section> _sections = [];
  List<Subsection> _subsections = [];

  RemoteAppDataSource(
    this._supabase,
    this.appDatabase,
  );

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
      }
    } catch (e) {
      log(e.toString());
    }
    return _articles;
  }

  @override
  Future<List<Category>> getCategories() async {
    try {
      if (_categories.isEmpty) {
        List<Map<String, dynamic>> data = await _supabase.client
            .from('categories')
            .select('*,sections(*,subsections(*))');
        _categories = data.map((e) => Category.fromMap(e)).toList();
      }
    } catch (e) {
      log(e.toString());
    }
    return _categories;
  }

  @override
  Future<List<Section>> getSections() async {
    try {
      if (_sections.isEmpty) {
        List<Map<String, dynamic>> data =
            await _supabase.client.from('sections').select('*,subsections(*)');
        _sections = data.map((e) => Section.fromMap(e)).toList();
      }
    } catch (e) {
      log(e.toString());
    }
    return _sections;
  }

  @override
  Future<List<Subsection>> getSubsections() async {
    try {
      if (_subsections.isEmpty) {
        List<Map<String, dynamic>> data =
            await _supabase.client.from('subsections').select('*');
        _subsections = data.map((e) => Subsection.fromMap(e)).toList();
      }
    } catch (e) {
      log(e.toString());
    }
    return _subsections;
  }
}
