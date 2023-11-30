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
            createdAt: Value(article.createdAt),
            premium: Value(article.premium),
            authorName: Value(article.authorName),
            completed: const Value(true),
          ),
          mode: InsertMode.replace,
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
          mode: InsertMode.replace,
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
          mode: InsertMode.replace,
        );
  }

  @override
  Future<void> insertSection(Section section) async {
    await _database.into(_database.sections).insert(
          SectionsCompanion.insert(
            id: section.id,
            categoryId: section.categoryId,
            title: section.title,
            orderId: section.orderId,
            createdAt: section.createdAt,
            articleId: section.articleId,
            premium: Value(section.premium),
          ),
          mode: InsertMode.replace,
        );
  }

  @override
  Future<void> insertSubsection(Subsection subsection) async {
    // log(subsection.data);
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
          mode: InsertMode.replace,
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
          mode: InsertMode.replace,
        );
  }

  @override
  Future<List<Article>> getArticles() async {
    final data = await _database.select(_database.articles).get();
    return data
        .map(
          (e) => Article(
            id: e.id,
            title: e.title,
            premium: e.premium,
            authorName: e.authorName ?? "",
            categories: [],
            orderId: 0,
          ),
        )
        .toList();
  }

  @override
  Future<List<Category>> getCategories() async {
    final data = await _database.select(_database.categories).get();
    return data
        .map(
          (e) => Category(
            id: e.id,
            title: e.title,
            createdAt: e.createdAt,
            articleId: e.articleId,
            orderId: e.orderId ?? 0,
            sections: [],
          ),
        )
        .toList();
  }

  @override
  Future<List<Code>> getCodes() async {
    final data = await _database.select(_database.codes).get();
    return data
        .map(
          (e) => Code(
            id: int.tryParse(e.id),
            code: e.code,
            userId: e.userId,
            providerName: e.providerName,
            subscriptionMonths: e.subscrioptionInMonths,
            price: e.price,
            createdAt: e.createdAt,
            isAvailable: e.isAavailable,
          ),
        )
        .toList();
  }

  @override
  Future<List<Section>> getSections() async {
    final data = await _database.select(_database.sections).get();
    return data
        .map(
          (e) => Section(
            id: e.id,
            title: e.title,
            createdAt: e.createdAt,
            articleId: e.articleId,
            orderId: e.orderId,
            categoryId: e.categoryId,
            premium: e.premium,
            subsections: [],
          ),
        )
        .toList();
  }

  @override
  Future<List<Subsection>> getSubsections() async {
    final data = await _database.select(_database.subsections).get();
    return data
        .map(
          (e) => Subsection(
            id: e.id,
            title: e.title,
            createdAt: e.createdAt,
            articleId: e.articleId,
            orderId: e.orderId,
            data: e.data,
            categoryId: e.categoryId,
            sectionId: e.sectionId,
          ),
        )
        .toList();
  }

  @override
  Future<List<AppUser>> getUsers() async {
    final data = await _database.select(_database.users).get();
    return data
        .map(
          (e) => AppUser(
            id: e.id,
            createdAt: e.createdAt,
            email: e.email,
            premium: e.premium,
            name: e.name,
            tel: e.tel,
            activationCode: e.activationCode,
            subscribedAt: e.subscribedAt,
            time: e.time,
          ),
        )
        .toList();
  }
}
