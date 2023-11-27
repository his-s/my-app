import 'dart:io';

import 'package:data_entery/data/models/values.dart';
import 'package:drift/drift.dart';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Articles extends Table {
  TextColumn get id => text().unique().named(ModelValues.id)();
  TextColumn get title => text().named(ModelValues.title)();
  IntColumn get order => integer().nullable().named(ModelValues.orderId)();
  DateTimeColumn get createdAt =>
      dateTime().nullable().named(ModelValues.createdAt)();
  BoolColumn get premium =>
      boolean().withDefault(const Constant(false)).named(ModelValues.premium)();
  BoolColumn get completed => boolean()
      .withDefault(const Constant(false))
      .named(ModelValues.completed)();
  TextColumn get authorName =>
      text().named(ModelValues.autherName).nullable()();
}

class Categories extends Table {
  TextColumn get id => text().unique().named(ModelValues.id)();
  TextColumn get title => text().named(ModelValues.title)();
  TextColumn get articleId => text().named(ModelValues.articleId)();
  DateTimeColumn get createdAt =>
      dateTime().nullable().named(ModelValues.createdAt)();
  IntColumn get orderId => integer().nullable().named(ModelValues.orderId)();
  BoolColumn get premium =>
      boolean().withDefault(const Constant(false)).named(ModelValues.premium)();
}

class Codes extends Table {
  TextColumn get id => text().unique().named(ModelValues.id)();
  TextColumn get code => text().named(ModelValues.code)();
  TextColumn get userId => text().named(ModelValues.userId)();
  TextColumn get providerName => text().named(ModelValues.providerName)();
  IntColumn get subscrioptionInMonths =>
      integer().named(ModelValues.subInMonth)();
  RealColumn get price => real().named(ModelValues.price)();
  DateTimeColumn get createdAt => dateTime().named(ModelValues.createdAt)();
  BoolColumn get isAavailable => boolean()
      .withDefault(const Constant(false))
      .named(ModelValues.isAvailable)();
}

class Sections extends Table {
  TextColumn get id => text().unique().named(ModelValues.id)();
  TextColumn get categorgId => text().named(ModelValues.categoryId)();
  TextColumn get title => text().named(ModelValues.title)();
  IntColumn get orderId => integer().named(ModelValues.orderId)();
  DateTimeColumn get createdAt => dateTime().named(ModelValues.createdAt)();
  TextColumn get articleId => text().named(ModelValues.articleId)();
  BoolColumn get premium =>
      boolean().withDefault(const Constant(false)).named(ModelValues.premium)();
}

class Subsections extends Table {
  TextColumn get id => text().unique().named(ModelValues.id)();
  TextColumn get sectionId => text().named(ModelValues.sectionId)();
  TextColumn get title => text().named(ModelValues.title)();
  TextColumn get data => text().named(ModelValues.data)();
  TextColumn get categoryId => text().named(ModelValues.categoryId)();
  IntColumn get orderId => integer().named(ModelValues.orderId)();
  DateTimeColumn get createdAt => dateTime().named(ModelValues.createdAt)();
  TextColumn get articleId => text().named(ModelValues.articleId)();
}

class Users extends Table {
  TextColumn get id => text().unique().named(ModelValues.id)();
  BoolColumn get premium =>
      boolean().withDefault(const Constant(false)).named(ModelValues.premium)();
  DateTimeColumn get createdAt => dateTime().named(ModelValues.createdAt)();
  TextColumn get name => text().named(ModelValues.name)();
  DateTimeColumn get subscribedAt =>
      dateTime().named(ModelValues.subscribedAt)();
  TextColumn get tel => text().named(ModelValues.tel)();
  TextColumn get email => text().named(ModelValues.email)();
  TextColumn get activationCode => text().named(ModelValues.activationCode)();
  IntColumn get time => integer().named(ModelValues.time)();
}

@DriftDatabase(
    tables: [Articles, Categories, Codes, Sections, Users, Subsections])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
