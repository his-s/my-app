// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_entery/data/models/articles_model.dart';

class AppState {
  List<Article> articles;
  List<Category> categories;
  List<Section> sections;
  List<Section> searched;
  List<Subsection> subsections;
  bool isLoading;
  AppState({
    required this.articles,
    required this.categories,
    required this.sections,
    required this.isLoading,
    required this.searched,
    required this.subsections,
  });
  AppState.empty()
      : articles = [],
        categories = [],
        sections = [],
        isLoading = false,
        searched = [],
        subsections = [];

  AppState copyWith({
    List<Article>? articles,
    List<Category>? categories,
    List<Section>? sections,
    bool? isLoading,
    List<Section>? searched,
    List<Subsection>? subsections,
  }) {
    return AppState(
      articles: articles ?? this.articles,
      categories: categories ?? this.categories,
      sections: sections ?? this.sections,
      isLoading: isLoading ?? this.isLoading,
      searched: searched ?? this.searched,
      subsections: subsections ?? this.subsections,
    );
  }
}
