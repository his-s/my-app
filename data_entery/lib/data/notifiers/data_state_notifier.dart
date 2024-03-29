import 'dart:developer';
import 'package:data_entery/data/models/articles_model.dart';
import 'package:data_entery/data/models/values.dart';
import 'package:data_entery/data/state/app_state.dart';
import 'package:data_entery/providers/app_data_repo.dart';
import 'package:data_entery/providers/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppDataNotifier extends StateNotifier<AppState> {
  final StateNotifierProviderRef _ref;

  AppDataNotifier(
    this._ref,
  ) : super(AppState.empty());
  List<Article> articles = [];
  List<Category> categories = [];
  List<Section> sections = [];
  getArticles() async {
    final appDataRepo = await _ref.watch(appDataRepoProvider.future);
    state = state.copyWith(isLoading: true);
    articles = await appDataRepo.getArticles();
    state = state.copyWith(
        articles: articles, isLoading: false, categories: categories);
  }

  getCategories() async {
    state = state.copyWith(isLoading: true);
    final appDataRepo = await _ref.watch(appDataRepoProvider.future);
    categories = await appDataRepo.getCategories();
    state = state.copyWith(categories: categories, isLoading: false);
  }

  getSections() async {
    state = state.copyWith(isLoading: true);
    final appDataRepo = await _ref.watch(appDataRepoProvider.future);
    sections = await appDataRepo.getSections();
    state = state.copyWith(sections: sections, isLoading: false);
  }

  getSubsections() async {
    state = state.copyWith(isLoading: true);
    final appDataRepo = await _ref.watch(appDataRepoProvider.future);
    final subsections = await appDataRepo.getSubsections();
    state = state.copyWith(
      sections: sections,
      isLoading: false,
      subsections: subsections,
    );
  }

  updateSearch(String value) {
    log(value);
    state = state.copyWith(
        searched: sections
            .where((element) =>
                element.title.toLowerCase().contains(value.toLowerCase()))
            .toList());
    if (value.isEmpty) {
      state = state.copyWith(searched: sections);
    }
  }

  uplode(Section topic) async {
    await supabase.client.from('sections').upsert({
      ModelValues.title: topic.title,
      ModelValues.id: topic.id,
      ModelValues.createdAt: topic.createdAt.toIso8601String(),
      ModelValues.orderId: topic.orderId,
      ModelValues.categoryId: topic.categoryId,
      ModelValues.premium: topic.premium,
      ModelValues.articleId: topic.articleId,
    });
    topic.subsections.forEach((element) async {
      await supabase.client.from('subsections').upsert({
        ModelValues.title: element.title,
        ModelValues.data: element.data,
        ModelValues.id: element.id,
        ModelValues.createdAt: element.createdAt.toIso8601String(),
        ModelValues.orderId: element.orderId,
        ModelValues.categoryId: element.categoryId,
        ModelValues.articleId: element.articleId,
        ModelValues.sectionId: element.sectionId,
      });
    });
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

  // uplode(Section topic) async {
  //   await supabase.from('sections').upsert({
  //     ModelValues.title: topic.title,
  //     ModelValues.id: topic.id,
  //     ModelValues.createdAt: topic.createdAt.toIso8601String(),
  //     ModelValues.orderId: topic.orderId,
  //     ModelValues.categoryId: topic.categoryId,
  //     ModelValues.premium: topic.premium,
  //     ModelValues.articleId: topic.articleId,
  //   });
  //   topic.subsections.forEach((element) async {
  //     await supabase.from('subsections').upsert({
  //       ModelValues.title: element.title,
  //       ModelValues.data: element.data,
  //       ModelValues.id: element.id,
  //       ModelValues.createdAt: element.createdAt.toIso8601String(),
  //       ModelValues.orderId: element.orderId,
  //       ModelValues.categoryId: element.categoryId,
  //       ModelValues.articleId: element.articleId,
  //       ModelValues.sectionId: element.sectionId,
  //     });
  //   });
  // }

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

