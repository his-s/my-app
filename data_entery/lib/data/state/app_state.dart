// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_entery/data/models/articles_model.dart';

class AppState {
  List<Article> articles;
  List<Category> categories;
  List<Section> sections;
  List<Section> searched;
  bool isLoading;
  AppState({
    required this.articles,
    required this.categories,
    required this.sections,
    required this.isLoading,
    required this.searched,
  });
  AppState.empty()
      : articles = [],
        categories = [],
        sections = [],
        isLoading = false,
        searched = [];

  AppState copyWith({
    List<Article>? articles,
    List<Category>? categories,
    List<Section>? sections,
    bool? isLoading,
    List<Section>? searched,
  }) {
    return AppState(
      articles: articles ?? this.articles,
      categories: categories ?? this.categories,
      sections: sections ?? this.sections,
      isLoading: isLoading ?? this.isLoading,
      searched: searched ?? this.searched,
    );
  }
}
