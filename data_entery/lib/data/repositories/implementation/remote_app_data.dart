import 'package:data_entery/data/models/articles_model.dart';
import 'package:data_entery/data/repositories/interfaces/app_data_inferface.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteAppData implements AppDataInterface {
  final Supabase _supabase;

  RemoteAppData(this._supabase);
  List<Article> articles = [];
  List<Category> categories = [];
  @override
  Future<List<Article>> getArticles() async {
    List<Map<String, dynamic>> data = await _supabase.client
        .from('articles')
        .select('*,categories(*,sections(*,subsections(*)))');
    articles = data.map((e) => Article.fromMap(e)).toList();
    return articles;
  }

  @override
  Future<Category> getCategories() {}

  @override
  Future<Section> getSections() {}
}
