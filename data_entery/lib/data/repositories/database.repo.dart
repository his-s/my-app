import 'package:data_entery/data/models/articles_model.dart';
import 'package:data_entery/data/models/code_model.dart';
import 'package:data_entery/data/models/user_model.dart';
import 'package:data_entery/data/repositories/implementation/database_implementation.dart';
import 'package:data_entery/data/repositories/interfaces/database_inferace.dart';

class DatabaseRepo implements DatabaseInterface {
  final LocalDatabase _localDatabase;

  DatabaseRepo(this._localDatabase);
  @override
  Future<void> insertArticle(Article article) async {
    await _localDatabase.insertArticle(article);
  }

  @override
  Future<void> insertCategory(Category category) {
    // TODO: implement insertCategory
    throw UnimplementedError();
  }

  @override
  Future<void> insertCode(Code code) {
    // TODO: implement insertCode
    throw UnimplementedError();
  }

  @override
  Future<void> insertSection(Section section) {
    // TODO: implement insertSection
    throw UnimplementedError();
  }

  @override
  Future<void> insertSubscetion(Subsection subsection) {
    // TODO: implement insertSubscetion
    throw UnimplementedError();
  }

  @override
  Future<void> insertUser(AppUser user) {
    // TODO: implement insertUser
    throw UnimplementedError();
  }
}
