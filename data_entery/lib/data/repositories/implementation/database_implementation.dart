import 'package:data_entery/data/database/database.dart'
    show AppDatabase, ArticlesCompanion, CategoriesCompanion, CodesCompanion;
import 'package:data_entery/data/models/articles_model.dart';
import 'package:data_entery/data/models/code_model.dart';
import 'package:data_entery/data/models/user_model.dart';
import 'package:data_entery/data/repositories/interfaces/database_inferace.dart';
import 'package:drift/drift.dart';

class LocalDatabase implements DatabaseInterface {
  final AppDatabase _database;

  LocalDatabase(this._database);

  @override
  Future<void> insertArticle(Article article) async {
    await _database.into(_database.articles).insert(
          ArticlesCompanion.insert(
            id: article.id,
            title: article.title,
            order: Value(article.orderId),
            createdAt: Value(article.createdAt),
            premium: Value(article.premium),
            authorName: Value(article.authorName),
            completed: const Value(true),
          ),
        );
  }

  @override
  Future<void> insertCategory(Category category) async {
    await _database.into(_database.categories).insert(
          CategoriesCompanion.insert(
            id: category.id,
            title: category.title,
            orderId: Value(category.orderId),
            createdAt: Value(category.createdAt),
            articleId: category.articleId,
            premium: const Value(true),
          ),
        );
  }

  @override
  Future<void> insertCode(Code code) async {
    await _database.into(_database.codes).insert(
          CodesCompanion.insert(
            id: code.id.toString(),
            createdAt: code.createdAt ?? DateTime.now(),
            code: code.code ?? '',
            userId: code.userId ?? '',
            providerName: code.providerName ?? '',
            subscrioptionInMonths: code.subscriptionMonths ?? 0,
            price: code.price ?? 0,
          ),
        );
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