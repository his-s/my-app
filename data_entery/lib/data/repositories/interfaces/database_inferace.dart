import 'package:data_entery/data/models/code_model.dart';
import 'package:data_entery/data/models/model.dart';

abstract class DatabaseInterface {
  Future<void> insertArticle(Article article);
  Future<void> insertCategory(Category category);
  Future<void> insertSection(Section section);
  Future<void> insertSubscetion(Subsection subsection);
  Future<void> insertUser(AppUser user);
  Future<void> insertCode(Code code);
}
