import 'package:data_entery/data/models/model.dart';

import '../../models/code_model.dart';

abstract class DatabaseInterface {
  Future<void> insertArticle(Article article);
  Future<void> insertCategory(Category category);
  Future<void> insertSection(Section section);
  Future<void> insertSubsection(Subsection subsection);
  Future<void> insertUser(AppUser user);
  Future<void> insertCode(Code code);
  Future<List<Code>> getCodes();
  Future<List<AppUser>> getUsers();
  Future<List<Article>> getArticles();
  Future<List<Category>> getCategories();
  Future<List<Section>> getSections();
  Future<List<Subsection>> getSubsections();
}
