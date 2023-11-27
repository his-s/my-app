// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ArticlesTable extends Articles with TableInfo<$ArticlesTable, Article> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticlesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _premiumMeta =
      const VerificationMeta('premium');
  @override
  late final GeneratedColumn<bool> premium = GeneratedColumn<bool>(
      'premium', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("premium" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _completedMeta =
      const VerificationMeta('completed');
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
      'completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("completed" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _authorNameMeta =
      const VerificationMeta('authorName');
  @override
  late final GeneratedColumn<String> authorName = GeneratedColumn<String>(
      'author_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, order, createdAt, premium, completed, authorName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'articles';
  @override
  VerificationContext validateIntegrity(Insertable<Article> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('premium')) {
      context.handle(_premiumMeta,
          premium.isAcceptableOrUnknown(data['premium']!, _premiumMeta));
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    }
    if (data.containsKey('author_name')) {
      context.handle(
          _authorNameMeta,
          authorName.isAcceptableOrUnknown(
              data['author_name']!, _authorNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Article map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Article(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      premium: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}premium'])!,
      completed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}completed'])!,
      authorName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author_name']),
    );
  }

  @override
  $ArticlesTable createAlias(String alias) {
    return $ArticlesTable(attachedDatabase, alias);
  }
}

class Article extends DataClass implements Insertable<Article> {
  final String id;
  final String title;
  final int? order;
  final DateTime? createdAt;
  final bool premium;
  final bool completed;
  final String? authorName;
  const Article(
      {required this.id,
      required this.title,
      this.order,
      this.createdAt,
      required this.premium,
      required this.completed,
      this.authorName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || order != null) {
      map['order'] = Variable<int>(order);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    map['premium'] = Variable<bool>(premium);
    map['completed'] = Variable<bool>(completed);
    if (!nullToAbsent || authorName != null) {
      map['author_name'] = Variable<String>(authorName);
    }
    return map;
  }

  ArticlesCompanion toCompanion(bool nullToAbsent) {
    return ArticlesCompanion(
      id: Value(id),
      title: Value(title),
      order:
          order == null && nullToAbsent ? const Value.absent() : Value(order),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      premium: Value(premium),
      completed: Value(completed),
      authorName: authorName == null && nullToAbsent
          ? const Value.absent()
          : Value(authorName),
    );
  }

  factory Article.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Article(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      order: serializer.fromJson<int?>(json['order']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      premium: serializer.fromJson<bool>(json['premium']),
      completed: serializer.fromJson<bool>(json['completed']),
      authorName: serializer.fromJson<String?>(json['authorName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'order': serializer.toJson<int?>(order),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'premium': serializer.toJson<bool>(premium),
      'completed': serializer.toJson<bool>(completed),
      'authorName': serializer.toJson<String?>(authorName),
    };
  }

  Article copyWith(
          {String? id,
          String? title,
          Value<int?> order = const Value.absent(),
          Value<DateTime?> createdAt = const Value.absent(),
          bool? premium,
          bool? completed,
          Value<String?> authorName = const Value.absent()}) =>
      Article(
        id: id ?? this.id,
        title: title ?? this.title,
        order: order.present ? order.value : this.order,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        premium: premium ?? this.premium,
        completed: completed ?? this.completed,
        authorName: authorName.present ? authorName.value : this.authorName,
      );
  @override
  String toString() {
    return (StringBuffer('Article(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('order: $order, ')
          ..write('createdAt: $createdAt, ')
          ..write('premium: $premium, ')
          ..write('completed: $completed, ')
          ..write('authorName: $authorName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, order, createdAt, premium, completed, authorName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Article &&
          other.id == this.id &&
          other.title == this.title &&
          other.order == this.order &&
          other.createdAt == this.createdAt &&
          other.premium == this.premium &&
          other.completed == this.completed &&
          other.authorName == this.authorName);
}

class ArticlesCompanion extends UpdateCompanion<Article> {
  final Value<String> id;
  final Value<String> title;
  final Value<int?> order;
  final Value<DateTime?> createdAt;
  final Value<bool> premium;
  final Value<bool> completed;
  final Value<String?> authorName;
  final Value<int> rowid;
  const ArticlesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.order = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.premium = const Value.absent(),
    this.completed = const Value.absent(),
    this.authorName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArticlesCompanion.insert({
    required String id,
    required String title,
    this.order = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.premium = const Value.absent(),
    this.completed = const Value.absent(),
    this.authorName = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title);
  static Insertable<Article> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int>? order,
    Expression<DateTime>? createdAt,
    Expression<bool>? premium,
    Expression<bool>? completed,
    Expression<String>? authorName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (order != null) 'order': order,
      if (createdAt != null) 'created_at': createdAt,
      if (premium != null) 'premium': premium,
      if (completed != null) 'completed': completed,
      if (authorName != null) 'author_name': authorName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArticlesCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<int?>? order,
      Value<DateTime?>? createdAt,
      Value<bool>? premium,
      Value<bool>? completed,
      Value<String?>? authorName,
      Value<int>? rowid}) {
    return ArticlesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      order: order ?? this.order,
      createdAt: createdAt ?? this.createdAt,
      premium: premium ?? this.premium,
      completed: completed ?? this.completed,
      authorName: authorName ?? this.authorName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (premium.present) {
      map['premium'] = Variable<bool>(premium.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (authorName.present) {
      map['author_name'] = Variable<String>(authorName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticlesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('order: $order, ')
          ..write('createdAt: $createdAt, ')
          ..write('premium: $premium, ')
          ..write('completed: $completed, ')
          ..write('authorName: $authorName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Categorie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _articleIdMeta =
      const VerificationMeta('articleId');
  @override
  late final GeneratedColumn<String> articleId = GeneratedColumn<String>(
      'article_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _orderIdMeta =
      const VerificationMeta('orderId');
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
      'order_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _premiumMeta =
      const VerificationMeta('premium');
  @override
  late final GeneratedColumn<bool> premium = GeneratedColumn<bool>(
      'premium', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("premium" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, articleId, createdAt, orderId, premium];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Categorie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('article_id')) {
      context.handle(_articleIdMeta,
          articleId.isAcceptableOrUnknown(data['article_id']!, _articleIdMeta));
    } else if (isInserting) {
      context.missing(_articleIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    }
    if (data.containsKey('premium')) {
      context.handle(_premiumMeta,
          premium.isAcceptableOrUnknown(data['premium']!, _premiumMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Categorie map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Categorie(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      articleId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}article_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      orderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_id']),
      premium: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}premium'])!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Categorie extends DataClass implements Insertable<Categorie> {
  final String id;
  final String title;
  final String articleId;
  final DateTime? createdAt;
  final int? orderId;
  final bool premium;
  const Categorie(
      {required this.id,
      required this.title,
      required this.articleId,
      this.createdAt,
      this.orderId,
      required this.premium});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['article_id'] = Variable<String>(articleId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || orderId != null) {
      map['order_id'] = Variable<int>(orderId);
    }
    map['premium'] = Variable<bool>(premium);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      title: Value(title),
      articleId: Value(articleId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      orderId: orderId == null && nullToAbsent
          ? const Value.absent()
          : Value(orderId),
      premium: Value(premium),
    );
  }

  factory Categorie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Categorie(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      articleId: serializer.fromJson<String>(json['articleId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      orderId: serializer.fromJson<int?>(json['orderId']),
      premium: serializer.fromJson<bool>(json['premium']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'articleId': serializer.toJson<String>(articleId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'orderId': serializer.toJson<int?>(orderId),
      'premium': serializer.toJson<bool>(premium),
    };
  }

  Categorie copyWith(
          {String? id,
          String? title,
          String? articleId,
          Value<DateTime?> createdAt = const Value.absent(),
          Value<int?> orderId = const Value.absent(),
          bool? premium}) =>
      Categorie(
        id: id ?? this.id,
        title: title ?? this.title,
        articleId: articleId ?? this.articleId,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        orderId: orderId.present ? orderId.value : this.orderId,
        premium: premium ?? this.premium,
      );
  @override
  String toString() {
    return (StringBuffer('Categorie(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('articleId: $articleId, ')
          ..write('createdAt: $createdAt, ')
          ..write('orderId: $orderId, ')
          ..write('premium: $premium')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, articleId, createdAt, orderId, premium);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Categorie &&
          other.id == this.id &&
          other.title == this.title &&
          other.articleId == this.articleId &&
          other.createdAt == this.createdAt &&
          other.orderId == this.orderId &&
          other.premium == this.premium);
}

class CategoriesCompanion extends UpdateCompanion<Categorie> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> articleId;
  final Value<DateTime?> createdAt;
  final Value<int?> orderId;
  final Value<bool> premium;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.articleId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.orderId = const Value.absent(),
    this.premium = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String id,
    required String title,
    required String articleId,
    this.createdAt = const Value.absent(),
    this.orderId = const Value.absent(),
    this.premium = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        articleId = Value(articleId);
  static Insertable<Categorie> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? articleId,
    Expression<DateTime>? createdAt,
    Expression<int>? orderId,
    Expression<bool>? premium,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (articleId != null) 'article_id': articleId,
      if (createdAt != null) 'created_at': createdAt,
      if (orderId != null) 'order_id': orderId,
      if (premium != null) 'premium': premium,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? articleId,
      Value<DateTime?>? createdAt,
      Value<int?>? orderId,
      Value<bool>? premium,
      Value<int>? rowid}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      articleId: articleId ?? this.articleId,
      createdAt: createdAt ?? this.createdAt,
      orderId: orderId ?? this.orderId,
      premium: premium ?? this.premium,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (articleId.present) {
      map['article_id'] = Variable<String>(articleId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (premium.present) {
      map['premium'] = Variable<bool>(premium.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('articleId: $articleId, ')
          ..write('createdAt: $createdAt, ')
          ..write('orderId: $orderId, ')
          ..write('premium: $premium, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CodesTable extends Codes with TableInfo<$CodesTable, Code> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CodesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _providerNameMeta =
      const VerificationMeta('providerName');
  @override
  late final GeneratedColumn<String> providerName = GeneratedColumn<String>(
      'provider_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subscrioptionInMonthsMeta =
      const VerificationMeta('subscrioptionInMonths');
  @override
  late final GeneratedColumn<int> subscrioptionInMonths = GeneratedColumn<int>(
      'subscrioption_in_months', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isAavailableMeta =
      const VerificationMeta('isAavailable');
  @override
  late final GeneratedColumn<bool> isAavailable = GeneratedColumn<bool>(
      'is_aavailable', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_aavailable" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        code,
        userId,
        providerName,
        subscrioptionInMonths,
        price,
        createdAt,
        isAavailable
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'codes';
  @override
  VerificationContext validateIntegrity(Insertable<Code> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('provider_name')) {
      context.handle(
          _providerNameMeta,
          providerName.isAcceptableOrUnknown(
              data['provider_name']!, _providerNameMeta));
    } else if (isInserting) {
      context.missing(_providerNameMeta);
    }
    if (data.containsKey('subscrioption_in_months')) {
      context.handle(
          _subscrioptionInMonthsMeta,
          subscrioptionInMonths.isAcceptableOrUnknown(
              data['subscrioption_in_months']!, _subscrioptionInMonthsMeta));
    } else if (isInserting) {
      context.missing(_subscrioptionInMonthsMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('is_aavailable')) {
      context.handle(
          _isAavailableMeta,
          isAavailable.isAcceptableOrUnknown(
              data['is_aavailable']!, _isAavailableMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Code map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Code(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      providerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}provider_name'])!,
      subscrioptionInMonths: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}subscrioption_in_months'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      isAavailable: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_aavailable'])!,
    );
  }

  @override
  $CodesTable createAlias(String alias) {
    return $CodesTable(attachedDatabase, alias);
  }
}

class Code extends DataClass implements Insertable<Code> {
  final String id;
  final String code;
  final String userId;
  final String providerName;
  final int subscrioptionInMonths;
  final double price;
  final DateTime createdAt;
  final bool isAavailable;
  const Code(
      {required this.id,
      required this.code,
      required this.userId,
      required this.providerName,
      required this.subscrioptionInMonths,
      required this.price,
      required this.createdAt,
      required this.isAavailable});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['code'] = Variable<String>(code);
    map['user_id'] = Variable<String>(userId);
    map['provider_name'] = Variable<String>(providerName);
    map['subscrioption_in_months'] = Variable<int>(subscrioptionInMonths);
    map['price'] = Variable<double>(price);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_aavailable'] = Variable<bool>(isAavailable);
    return map;
  }

  CodesCompanion toCompanion(bool nullToAbsent) {
    return CodesCompanion(
      id: Value(id),
      code: Value(code),
      userId: Value(userId),
      providerName: Value(providerName),
      subscrioptionInMonths: Value(subscrioptionInMonths),
      price: Value(price),
      createdAt: Value(createdAt),
      isAavailable: Value(isAavailable),
    );
  }

  factory Code.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Code(
      id: serializer.fromJson<String>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      userId: serializer.fromJson<String>(json['userId']),
      providerName: serializer.fromJson<String>(json['providerName']),
      subscrioptionInMonths:
          serializer.fromJson<int>(json['subscrioptionInMonths']),
      price: serializer.fromJson<double>(json['price']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isAavailable: serializer.fromJson<bool>(json['isAavailable']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'code': serializer.toJson<String>(code),
      'userId': serializer.toJson<String>(userId),
      'providerName': serializer.toJson<String>(providerName),
      'subscrioptionInMonths': serializer.toJson<int>(subscrioptionInMonths),
      'price': serializer.toJson<double>(price),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isAavailable': serializer.toJson<bool>(isAavailable),
    };
  }

  Code copyWith(
          {String? id,
          String? code,
          String? userId,
          String? providerName,
          int? subscrioptionInMonths,
          double? price,
          DateTime? createdAt,
          bool? isAavailable}) =>
      Code(
        id: id ?? this.id,
        code: code ?? this.code,
        userId: userId ?? this.userId,
        providerName: providerName ?? this.providerName,
        subscrioptionInMonths:
            subscrioptionInMonths ?? this.subscrioptionInMonths,
        price: price ?? this.price,
        createdAt: createdAt ?? this.createdAt,
        isAavailable: isAavailable ?? this.isAavailable,
      );
  @override
  String toString() {
    return (StringBuffer('Code(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('userId: $userId, ')
          ..write('providerName: $providerName, ')
          ..write('subscrioptionInMonths: $subscrioptionInMonths, ')
          ..write('price: $price, ')
          ..write('createdAt: $createdAt, ')
          ..write('isAavailable: $isAavailable')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, userId, providerName,
      subscrioptionInMonths, price, createdAt, isAavailable);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Code &&
          other.id == this.id &&
          other.code == this.code &&
          other.userId == this.userId &&
          other.providerName == this.providerName &&
          other.subscrioptionInMonths == this.subscrioptionInMonths &&
          other.price == this.price &&
          other.createdAt == this.createdAt &&
          other.isAavailable == this.isAavailable);
}

class CodesCompanion extends UpdateCompanion<Code> {
  final Value<String> id;
  final Value<String> code;
  final Value<String> userId;
  final Value<String> providerName;
  final Value<int> subscrioptionInMonths;
  final Value<double> price;
  final Value<DateTime> createdAt;
  final Value<bool> isAavailable;
  final Value<int> rowid;
  const CodesCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.userId = const Value.absent(),
    this.providerName = const Value.absent(),
    this.subscrioptionInMonths = const Value.absent(),
    this.price = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isAavailable = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CodesCompanion.insert({
    required String id,
    required String code,
    required String userId,
    required String providerName,
    required int subscrioptionInMonths,
    required double price,
    required DateTime createdAt,
    this.isAavailable = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        code = Value(code),
        userId = Value(userId),
        providerName = Value(providerName),
        subscrioptionInMonths = Value(subscrioptionInMonths),
        price = Value(price),
        createdAt = Value(createdAt);
  static Insertable<Code> custom({
    Expression<String>? id,
    Expression<String>? code,
    Expression<String>? userId,
    Expression<String>? providerName,
    Expression<int>? subscrioptionInMonths,
    Expression<double>? price,
    Expression<DateTime>? createdAt,
    Expression<bool>? isAavailable,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (userId != null) 'user_id': userId,
      if (providerName != null) 'provider_name': providerName,
      if (subscrioptionInMonths != null)
        'subscrioption_in_months': subscrioptionInMonths,
      if (price != null) 'price': price,
      if (createdAt != null) 'created_at': createdAt,
      if (isAavailable != null) 'is_aavailable': isAavailable,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CodesCompanion copyWith(
      {Value<String>? id,
      Value<String>? code,
      Value<String>? userId,
      Value<String>? providerName,
      Value<int>? subscrioptionInMonths,
      Value<double>? price,
      Value<DateTime>? createdAt,
      Value<bool>? isAavailable,
      Value<int>? rowid}) {
    return CodesCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      userId: userId ?? this.userId,
      providerName: providerName ?? this.providerName,
      subscrioptionInMonths:
          subscrioptionInMonths ?? this.subscrioptionInMonths,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
      isAavailable: isAavailable ?? this.isAavailable,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (providerName.present) {
      map['provider_name'] = Variable<String>(providerName.value);
    }
    if (subscrioptionInMonths.present) {
      map['subscrioption_in_months'] =
          Variable<int>(subscrioptionInMonths.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isAavailable.present) {
      map['is_aavailable'] = Variable<bool>(isAavailable.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CodesCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('userId: $userId, ')
          ..write('providerName: $providerName, ')
          ..write('subscrioptionInMonths: $subscrioptionInMonths, ')
          ..write('price: $price, ')
          ..write('createdAt: $createdAt, ')
          ..write('isAavailable: $isAavailable, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SectionsTable extends Sections with TableInfo<$SectionsTable, Section> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _categorgIdMeta =
      const VerificationMeta('categorgId');
  @override
  late final GeneratedColumn<String> categorgId = GeneratedColumn<String>(
      'categorg_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _orderIdMeta =
      const VerificationMeta('orderId');
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
      'order_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _articleIdMeta =
      const VerificationMeta('articleId');
  @override
  late final GeneratedColumn<String> articleId = GeneratedColumn<String>(
      'article_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _premiumMeta =
      const VerificationMeta('premium');
  @override
  late final GeneratedColumn<bool> premium = GeneratedColumn<bool>(
      'premium', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("premium" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, categorgId, title, orderId, createdAt, articleId, premium];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sections';
  @override
  VerificationContext validateIntegrity(Insertable<Section> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('categorg_id')) {
      context.handle(
          _categorgIdMeta,
          categorgId.isAcceptableOrUnknown(
              data['categorg_id']!, _categorgIdMeta));
    } else if (isInserting) {
      context.missing(_categorgIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('article_id')) {
      context.handle(_articleIdMeta,
          articleId.isAcceptableOrUnknown(data['article_id']!, _articleIdMeta));
    } else if (isInserting) {
      context.missing(_articleIdMeta);
    }
    if (data.containsKey('premium')) {
      context.handle(_premiumMeta,
          premium.isAcceptableOrUnknown(data['premium']!, _premiumMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Section map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Section(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      categorgId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}categorg_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      orderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      articleId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}article_id'])!,
      premium: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}premium'])!,
    );
  }

  @override
  $SectionsTable createAlias(String alias) {
    return $SectionsTable(attachedDatabase, alias);
  }
}

class Section extends DataClass implements Insertable<Section> {
  final String id;
  final String categorgId;
  final String title;
  final int orderId;
  final DateTime createdAt;
  final String articleId;
  final bool premium;
  const Section(
      {required this.id,
      required this.categorgId,
      required this.title,
      required this.orderId,
      required this.createdAt,
      required this.articleId,
      required this.premium});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['categorg_id'] = Variable<String>(categorgId);
    map['title'] = Variable<String>(title);
    map['order_id'] = Variable<int>(orderId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['article_id'] = Variable<String>(articleId);
    map['premium'] = Variable<bool>(premium);
    return map;
  }

  SectionsCompanion toCompanion(bool nullToAbsent) {
    return SectionsCompanion(
      id: Value(id),
      categorgId: Value(categorgId),
      title: Value(title),
      orderId: Value(orderId),
      createdAt: Value(createdAt),
      articleId: Value(articleId),
      premium: Value(premium),
    );
  }

  factory Section.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Section(
      id: serializer.fromJson<String>(json['id']),
      categorgId: serializer.fromJson<String>(json['categorgId']),
      title: serializer.fromJson<String>(json['title']),
      orderId: serializer.fromJson<int>(json['orderId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      articleId: serializer.fromJson<String>(json['articleId']),
      premium: serializer.fromJson<bool>(json['premium']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'categorgId': serializer.toJson<String>(categorgId),
      'title': serializer.toJson<String>(title),
      'orderId': serializer.toJson<int>(orderId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'articleId': serializer.toJson<String>(articleId),
      'premium': serializer.toJson<bool>(premium),
    };
  }

  Section copyWith(
          {String? id,
          String? categorgId,
          String? title,
          int? orderId,
          DateTime? createdAt,
          String? articleId,
          bool? premium}) =>
      Section(
        id: id ?? this.id,
        categorgId: categorgId ?? this.categorgId,
        title: title ?? this.title,
        orderId: orderId ?? this.orderId,
        createdAt: createdAt ?? this.createdAt,
        articleId: articleId ?? this.articleId,
        premium: premium ?? this.premium,
      );
  @override
  String toString() {
    return (StringBuffer('Section(')
          ..write('id: $id, ')
          ..write('categorgId: $categorgId, ')
          ..write('title: $title, ')
          ..write('orderId: $orderId, ')
          ..write('createdAt: $createdAt, ')
          ..write('articleId: $articleId, ')
          ..write('premium: $premium')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, categorgId, title, orderId, createdAt, articleId, premium);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Section &&
          other.id == this.id &&
          other.categorgId == this.categorgId &&
          other.title == this.title &&
          other.orderId == this.orderId &&
          other.createdAt == this.createdAt &&
          other.articleId == this.articleId &&
          other.premium == this.premium);
}

class SectionsCompanion extends UpdateCompanion<Section> {
  final Value<String> id;
  final Value<String> categorgId;
  final Value<String> title;
  final Value<int> orderId;
  final Value<DateTime> createdAt;
  final Value<String> articleId;
  final Value<bool> premium;
  final Value<int> rowid;
  const SectionsCompanion({
    this.id = const Value.absent(),
    this.categorgId = const Value.absent(),
    this.title = const Value.absent(),
    this.orderId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.articleId = const Value.absent(),
    this.premium = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SectionsCompanion.insert({
    required String id,
    required String categorgId,
    required String title,
    required int orderId,
    required DateTime createdAt,
    required String articleId,
    this.premium = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        categorgId = Value(categorgId),
        title = Value(title),
        orderId = Value(orderId),
        createdAt = Value(createdAt),
        articleId = Value(articleId);
  static Insertable<Section> custom({
    Expression<String>? id,
    Expression<String>? categorgId,
    Expression<String>? title,
    Expression<int>? orderId,
    Expression<DateTime>? createdAt,
    Expression<String>? articleId,
    Expression<bool>? premium,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categorgId != null) 'categorg_id': categorgId,
      if (title != null) 'title': title,
      if (orderId != null) 'order_id': orderId,
      if (createdAt != null) 'created_at': createdAt,
      if (articleId != null) 'article_id': articleId,
      if (premium != null) 'premium': premium,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SectionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? categorgId,
      Value<String>? title,
      Value<int>? orderId,
      Value<DateTime>? createdAt,
      Value<String>? articleId,
      Value<bool>? premium,
      Value<int>? rowid}) {
    return SectionsCompanion(
      id: id ?? this.id,
      categorgId: categorgId ?? this.categorgId,
      title: title ?? this.title,
      orderId: orderId ?? this.orderId,
      createdAt: createdAt ?? this.createdAt,
      articleId: articleId ?? this.articleId,
      premium: premium ?? this.premium,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (categorgId.present) {
      map['categorg_id'] = Variable<String>(categorgId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (articleId.present) {
      map['article_id'] = Variable<String>(articleId.value);
    }
    if (premium.present) {
      map['premium'] = Variable<bool>(premium.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SectionsCompanion(')
          ..write('id: $id, ')
          ..write('categorgId: $categorgId, ')
          ..write('title: $title, ')
          ..write('orderId: $orderId, ')
          ..write('createdAt: $createdAt, ')
          ..write('articleId: $articleId, ')
          ..write('premium: $premium, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _premiumMeta =
      const VerificationMeta('premium');
  @override
  late final GeneratedColumn<bool> premium = GeneratedColumn<bool>(
      'premium', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("premium" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subscribedAtMeta =
      const VerificationMeta('subscribedAt');
  @override
  late final GeneratedColumn<DateTime> subscribedAt = GeneratedColumn<DateTime>(
      'subscribed_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _telMeta = const VerificationMeta('tel');
  @override
  late final GeneratedColumn<String> tel = GeneratedColumn<String>(
      'tel', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _activationCodeMeta =
      const VerificationMeta('activationCode');
  @override
  late final GeneratedColumn<String> activationCode = GeneratedColumn<String>(
      'activation_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int> time = GeneratedColumn<int>(
      'time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        premium,
        createdAt,
        name,
        subscribedAt,
        tel,
        email,
        activationCode,
        time
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('premium')) {
      context.handle(_premiumMeta,
          premium.isAcceptableOrUnknown(data['premium']!, _premiumMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('subscribed_at')) {
      context.handle(
          _subscribedAtMeta,
          subscribedAt.isAcceptableOrUnknown(
              data['subscribed_at']!, _subscribedAtMeta));
    } else if (isInserting) {
      context.missing(_subscribedAtMeta);
    }
    if (data.containsKey('tel')) {
      context.handle(
          _telMeta, tel.isAcceptableOrUnknown(data['tel']!, _telMeta));
    } else if (isInserting) {
      context.missing(_telMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('activation_code')) {
      context.handle(
          _activationCodeMeta,
          activationCode.isAcceptableOrUnknown(
              data['activation_code']!, _activationCodeMeta));
    } else if (isInserting) {
      context.missing(_activationCodeMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      premium: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}premium'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      subscribedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}subscribed_at'])!,
      tel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tel'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      activationCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}activation_code'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String id;
  final bool premium;
  final DateTime createdAt;
  final String name;
  final DateTime subscribedAt;
  final String tel;
  final String email;
  final String activationCode;
  final int time;
  const User(
      {required this.id,
      required this.premium,
      required this.createdAt,
      required this.name,
      required this.subscribedAt,
      required this.tel,
      required this.email,
      required this.activationCode,
      required this.time});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['premium'] = Variable<bool>(premium);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['name'] = Variable<String>(name);
    map['subscribed_at'] = Variable<DateTime>(subscribedAt);
    map['tel'] = Variable<String>(tel);
    map['email'] = Variable<String>(email);
    map['activation_code'] = Variable<String>(activationCode);
    map['time'] = Variable<int>(time);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      premium: Value(premium),
      createdAt: Value(createdAt),
      name: Value(name),
      subscribedAt: Value(subscribedAt),
      tel: Value(tel),
      email: Value(email),
      activationCode: Value(activationCode),
      time: Value(time),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<String>(json['id']),
      premium: serializer.fromJson<bool>(json['premium']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      name: serializer.fromJson<String>(json['name']),
      subscribedAt: serializer.fromJson<DateTime>(json['subscribedAt']),
      tel: serializer.fromJson<String>(json['tel']),
      email: serializer.fromJson<String>(json['email']),
      activationCode: serializer.fromJson<String>(json['activationCode']),
      time: serializer.fromJson<int>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'premium': serializer.toJson<bool>(premium),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'name': serializer.toJson<String>(name),
      'subscribedAt': serializer.toJson<DateTime>(subscribedAt),
      'tel': serializer.toJson<String>(tel),
      'email': serializer.toJson<String>(email),
      'activationCode': serializer.toJson<String>(activationCode),
      'time': serializer.toJson<int>(time),
    };
  }

  User copyWith(
          {String? id,
          bool? premium,
          DateTime? createdAt,
          String? name,
          DateTime? subscribedAt,
          String? tel,
          String? email,
          String? activationCode,
          int? time}) =>
      User(
        id: id ?? this.id,
        premium: premium ?? this.premium,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        subscribedAt: subscribedAt ?? this.subscribedAt,
        tel: tel ?? this.tel,
        email: email ?? this.email,
        activationCode: activationCode ?? this.activationCode,
        time: time ?? this.time,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('premium: $premium, ')
          ..write('createdAt: $createdAt, ')
          ..write('name: $name, ')
          ..write('subscribedAt: $subscribedAt, ')
          ..write('tel: $tel, ')
          ..write('email: $email, ')
          ..write('activationCode: $activationCode, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, premium, createdAt, name, subscribedAt,
      tel, email, activationCode, time);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.premium == this.premium &&
          other.createdAt == this.createdAt &&
          other.name == this.name &&
          other.subscribedAt == this.subscribedAt &&
          other.tel == this.tel &&
          other.email == this.email &&
          other.activationCode == this.activationCode &&
          other.time == this.time);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> id;
  final Value<bool> premium;
  final Value<DateTime> createdAt;
  final Value<String> name;
  final Value<DateTime> subscribedAt;
  final Value<String> tel;
  final Value<String> email;
  final Value<String> activationCode;
  final Value<int> time;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.premium = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.name = const Value.absent(),
    this.subscribedAt = const Value.absent(),
    this.tel = const Value.absent(),
    this.email = const Value.absent(),
    this.activationCode = const Value.absent(),
    this.time = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    this.premium = const Value.absent(),
    required DateTime createdAt,
    required String name,
    required DateTime subscribedAt,
    required String tel,
    required String email,
    required String activationCode,
    required int time,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        createdAt = Value(createdAt),
        name = Value(name),
        subscribedAt = Value(subscribedAt),
        tel = Value(tel),
        email = Value(email),
        activationCode = Value(activationCode),
        time = Value(time);
  static Insertable<User> custom({
    Expression<String>? id,
    Expression<bool>? premium,
    Expression<DateTime>? createdAt,
    Expression<String>? name,
    Expression<DateTime>? subscribedAt,
    Expression<String>? tel,
    Expression<String>? email,
    Expression<String>? activationCode,
    Expression<int>? time,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (premium != null) 'premium': premium,
      if (createdAt != null) 'created_at': createdAt,
      if (name != null) 'name': name,
      if (subscribedAt != null) 'subscribed_at': subscribedAt,
      if (tel != null) 'tel': tel,
      if (email != null) 'email': email,
      if (activationCode != null) 'activation_code': activationCode,
      if (time != null) 'time': time,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? id,
      Value<bool>? premium,
      Value<DateTime>? createdAt,
      Value<String>? name,
      Value<DateTime>? subscribedAt,
      Value<String>? tel,
      Value<String>? email,
      Value<String>? activationCode,
      Value<int>? time,
      Value<int>? rowid}) {
    return UsersCompanion(
      id: id ?? this.id,
      premium: premium ?? this.premium,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      subscribedAt: subscribedAt ?? this.subscribedAt,
      tel: tel ?? this.tel,
      email: email ?? this.email,
      activationCode: activationCode ?? this.activationCode,
      time: time ?? this.time,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (premium.present) {
      map['premium'] = Variable<bool>(premium.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (subscribedAt.present) {
      map['subscribed_at'] = Variable<DateTime>(subscribedAt.value);
    }
    if (tel.present) {
      map['tel'] = Variable<String>(tel.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (activationCode.present) {
      map['activation_code'] = Variable<String>(activationCode.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('premium: $premium, ')
          ..write('createdAt: $createdAt, ')
          ..write('name: $name, ')
          ..write('subscribedAt: $subscribedAt, ')
          ..write('tel: $tel, ')
          ..write('email: $email, ')
          ..write('activationCode: $activationCode, ')
          ..write('time: $time, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $ArticlesTable articles = $ArticlesTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $CodesTable codes = $CodesTable(this);
  late final $SectionsTable sections = $SectionsTable(this);
  late final $UsersTable users = $UsersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [articles, categories, codes, sections, users];
}
