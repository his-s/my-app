import 'package:data_entery/data/models/articles_model.dart';
import 'package:data_entery/data/models/code_model.dart';
import 'package:data_entery/data/models/user_model.dart';
import 'package:data_entery/data/repositories/implementation/database_implementation.dart';
import 'package:data_entery/data/repositories/interfaces/database_inferace.dart';

class DatabaseRepo implements DatabaseInterface {
  final LocalDatabase _localDatabase;

  DatabaseRepo({required LocalDatabase localDatabase})
      : _localDatabase = localDatabase;

  @override
  Future<void> insertArticle(Article article) async {
    await _localDatabase.insertArticle(article);
  }

  @override
  Future<void> insertCategory(Category category) async {
    await _localDatabase.insertCategory(category);
  }

  @override
  Future<void> insertCode(Code code) async {
    await _localDatabase.insertCode(code);
  }

  @override
  Future<void> insertSection(Section section) async {
    await _localDatabase.insertSection(section);
  }

  @override
  Future<void> insertSubsection(Subsection subsection) async {
    await _localDatabase.insertSubsection(subsection);
  }

  @override
  Future<void> insertUser(AppUser user) async {
    await _localDatabase.insertUser(user);
  }

  @override
  Future<List<Article>> getArticles() async {
    return await _localDatabase.getArticles();
  }

  @override
  Future<List<Category>> getCategories() async {
    return await _localDatabase.getCategories();
  }

  @override
  Future<List<Code>> getCodes() async {
    return await _localDatabase.getCodes();
  }

  @override
  Future<List<Section>> getSections() async {
    return await _localDatabase.getSections();
  }

  @override
  Future<List<Subsection>> getSubsections() async {
    return await _localDatabase.getSubsections();
  }

  @override
  Future<List<AppUser>> getUsers() async {
    return await _localDatabase.getUsers();
  }
}
