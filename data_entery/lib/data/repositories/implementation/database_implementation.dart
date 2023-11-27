import 'package:data_entery/data/database/database.dart'
    show
        AppDatabase,
        ArticlesCompanion,
        CategoriesCompanion,
        CodesCompanion,
        SectionsCompanion,
        SubsectionsCompanion,
        UsersCompanion;
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
  Future<void> insertSection(Section section) async {
    await _database.into(_database.sections).insert(SectionsCompanion.insert(
          id: section.id,
          categorgId: section.categoryId,
          title: section.title,
          orderId: section.orderId,
          createdAt: section.createdAt,
          articleId: section.articleId,
          premium: Value(section.premium),
        ));
  }

  @override
  Future<void> insertSubscetion(Subsection subsection) async {
    await _database.into(_database.subsections).insert(
          SubsectionsCompanion.insert(
            id: subsection.id,
            sectionId: subsection.sectionId,
            title: subsection.title,
            data: subsection.data,
            categoryId: subsection.categoryId,
            orderId: subsection.orderId,
            createdAt: subsection.createdAt,
            articleId: subsection.articleId,
          ),
        );
  }

  @override
  Future<void> insertUser(AppUser user) async {
    await _database.into(_database.users).insert(
          UsersCompanion.insert(
            id: user.id,
            createdAt: user.createdAt ?? DateTime.now(),
            name: user.name ?? '',
            subscribedAt: user.subscribedAt ?? DateTime.now(),
            tel: user.tel ?? '',
            email: user.email,
            activationCode: user.activationCode ?? '',
            time: user.time ?? 0,
          ),
        );
  }
}
