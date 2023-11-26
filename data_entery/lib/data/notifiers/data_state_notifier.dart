import 'package:data_entery/data/models/articles_model.dart';
import 'package:data_entery/data/repositories/implementation/local_app_data.dart';
import 'package:data_entery/data/repositories/implementation/remote_app_data.dart';
import 'package:data_entery/data/state/app_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppDataNotifier extends StateNotifier<AppState> {
  final LocalAppData _localAppData;
  final RemoteAppData _remoteAppData;
  final Supabase _supabase;
  AppDataNotifier(this._supabase, this._localAppData, this._remoteAppData)
      : super(AppState.empty());
  loadAllArticles() async {
    List<Article> articles = [];
    List<Category> categories = [];
    if (articles.isEmpty) {
      state = state.copyWith(isLoading: true);
      // List<Map<String, dynamic>> data = await _supabase.client
      //     .from('articles')
      //     .select('*,categories(*,sections(*,subsections(*)))');
      // articles = data.map((e) => Article.fromMap(e)).toList();

      // for (var element in articles) {
      //   categories = element.categories;
      // }
      articles = await _remoteAppData.getArticles();
      categories = _remoteAppData.getCategories();
      state = state.copyWith(
          articles: articles, isLoading: false, categories: categories);
    } else {
      return;
    }
  }

  loadAllTopics() async {
    state = state.copyWith(isLoading: true);
    List<Map<String, dynamic>> data =
        await _supabase.client.from('sections').select('*,subsections(*)');
    List<Section> topics = data.map((e) => Section.fromMap(e)).toList();
    state = state.copyWith(sections: topics, isLoading: false);
  }

  updateSearch(String value) {
    state.searched = state.sections
        .where((element) =>
            element.title.toLowerCase().contains(value.toLowerCase()))
        .toList();
    if (value.isEmpty) {
      state.searched = state.sections;
    }
  }
}

// class AppData extends ChangeNotifier {
//   List<Article> articles = [];
//   List<Category> categories = [];
//   List<Section> topics = [];
//   bool isLoading = false;
//   final supabase = Supabase.instance.client;
//   loadJsonFromAsset(String fileName) async {
//     isLoading = true;

//     final List<Map<String, dynamic>> data =
//         await supabase.from('articles').select('''
//     title,
//     id,
//     premium,
//     created_at,
//     order_id,
//     author_name,
//     categories(title, id, article_id, created_at, order_id, sections(title, id, created_at, order_id, category_id, premium,article_id, subsections(title, id, data, created_at, order_id, category_id, section_id)))
//     ''');
//     List<Map<String, dynamic>> sections =
//         await supabase.from('sections').select('*,subsections(*)');
//     topics = sections.map((e) => Section.fromMap(e)).toList();
//     articles = data.map((e) => Article.fromMap(e)).toList();
//     // articles = await getAllArticles();
//     categories = articles.first.categories;
//     // categories = await getAllCatergoriesWhere(articles.first.id);

//     isLoading = false;
//     loadTopics();
//     notifyListeners();
//   }

//   loadTopics() {
//     searched = topics;
//     notifyListeners();
//   }

//   Future<List<Article>> getAllArticles() async {
//     List<Map<String, dynamic>> data =
//         await supabase.from('articles').select('*');
//     return data.map((e) => Article.fromMap(e)).toList();
//   }

//   Future<List<Category>> getAllCatergoriesWhere(String articleId) async {
//     List<dynamic> data = await supabase
//         .from('categories')
//         .select('*')
//         .eq(ModelValues.articleId, articleId);
//     return data.map((e) => Category.fromMap(e)).toList();
//   }

//   uplode(Section topic) async {
//     await supabase.from('sections').upsert({
//       ModelValues.title: topic.title,
//       ModelValues.id: topic.id,
//       ModelValues.createdAt: topic.createdAt.toIso8601String(),
//       ModelValues.orderId: topic.orderId,
//       ModelValues.categoryId: topic.categoryId,
//       ModelValues.premium: topic.premium,
//       ModelValues.articleId: topic.articleId,
//     });
//     topic.subsections.forEach((element) async {
//       await supabase.from('subsections').upsert({
//         ModelValues.title: element.title,
//         ModelValues.data: element.data,
//         ModelValues.id: element.id,
//         ModelValues.createdAt: element.createdAt.toIso8601String(),
//         ModelValues.orderId: element.orderId,
//         ModelValues.categoryId: element.categoryId,
//         ModelValues.articleId: element.articleId,
//         ModelValues.sectionId: element.sectionId,
//       });
//     });
//   }

//   Future<List<Section>> getAllSection(String categoryId) async {
//     return await supabase
//         .from('sections')
//         .select('*')
//         .eq(ModelValues.categoryId, categoryId);
//   }

//   Future<List<Subsection>> getAllSubsections(String sectionId) async {
//     return await supabase
//         .from('subsections')
//         .select('*')
//         .eq(ModelValues.categoryId, sectionId);
//   }

//   List<Section> searched = [];

//   updateSearch(String data) {
//     searched = topics
//         .where((element) =>
//             element.title.toLowerCase().contains(data.toLowerCase()))
//         .toList();
//     if (data.isEmpty) {
//       searched = topics;
//     }
//     notifyListeners();
//   }
// }

