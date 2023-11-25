// ignore_for_file: public_member_api_docs, sort_constructors_first
// models.dart
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import 'package:data_entery/data/models/values.dart';

class Article {
  final String title;
  final String id;
  final bool premium;
  final DateTime createdAt;
  final int orderId;
  final String authorName;
  final List<Category> categories;

  Article({
    required String? id,
    createdAt, // Nullable since server time might not be available
    required this.title,
    required this.premium,
    required this.orderId,
    required this.authorName,
    required this.categories,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ??
            DateTime.now()
                .toUtc(); // Default to current time if server time is not available

  Article copyWith({
    String? title,
    String? id,
    bool? premium,
    DateTime? createdAt,
    int? orderId,
    String? authorName,
    List<Category>? categories,
  }) {
    return Article(
      title: title ?? this.title,
      id: id ?? this.id,
      premium: premium ?? this.premium,
      createdAt: createdAt ?? this.createdAt,
      orderId: orderId ?? this.orderId,
      authorName: authorName ?? this.authorName,
      categories: categories ?? this.categories,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ModelValues.title: title,
      ModelValues.id: id,
      ModelValues.premium: premium,
      ModelValues.createdAt: createdAt.millisecondsSinceEpoch,
      ModelValues.orderId: orderId,
      ModelValues.autherName: authorName,
      ModelValues.categories: categories.map((x) => x.toMap()).toList(),
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map[ModelValues.title] as String,
      id: map[ModelValues.id] as String,
      premium: map[ModelValues.premium] as bool,
      createdAt: map[ModelValues.createdAt] != null
          ? DateTime.tryParse(map[ModelValues.createdAt])
          : DateTime.now(),
      orderId: map[ModelValues.orderId] as int,
      authorName: map[ModelValues.autherName] as String,
      categories: map[ModelValues.categories] == null
          ? []
          : List<Category>.from(
              (map[ModelValues.categories] as List<dynamic>).map<Category>(
                (x) => Category.fromMap(x as Map<String, dynamic>),
              ),
            ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Article(title: $title, id: $id, premium: $premium, createdAt: $createdAt, orderId: $orderId, authorName: $authorName, categories: $categories)';
  }

  @override
  bool operator ==(covariant Article other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.id == id &&
        other.premium == premium &&
        other.createdAt == createdAt &&
        other.orderId == orderId &&
        other.authorName == authorName &&
        listEquals(other.categories, categories);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        id.hashCode ^
        premium.hashCode ^
        createdAt.hashCode ^
        orderId.hashCode ^
        authorName.hashCode ^
        categories.hashCode;
  }
}

class Category {
  final String title;
  final String id;
  final String articleId;
  final DateTime createdAt;
  final int orderId;
  final List<Section> sections;

  Category({
    required String? id,
    required DateTime? createdAt,
    required this.title,
    required this.articleId,
    required this.orderId,
    required this.sections,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now().toUtc();

  Category copyWith({
    String? title,
    String? id,
    String? articleId,
    DateTime? createdAt,
    int? orderId,
    List<Section>? sections,
  }) {
    return Category(
      title: title ?? this.title,
      id: id ?? this.id,
      articleId: articleId ?? this.articleId,
      createdAt: createdAt ?? this.createdAt,
      orderId: orderId ?? this.orderId,
      sections: sections ?? this.sections,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ModelValues.title: title,
      ModelValues.id: id,
      ModelValues.articleId: articleId,
      ModelValues.createdAt: createdAt.millisecondsSinceEpoch,
      ModelValues.orderId: orderId,
      ModelValues.sections: sections.map((x) => x.toMap()).toList(),
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      title: map[ModelValues.title] as String,
      id: map[ModelValues.id] as String,
      articleId: map[ModelValues.articleId] as String,
      createdAt: DateTime.tryParse(map[ModelValues.createdAt]),
      orderId: map[ModelValues.orderId] as int,
      sections: map[ModelValues.sections] == null
          ? []
          : List<Section>.from(
              (map[ModelValues.sections] as List<dynamic>).map<Section>(
                (x) => Section.fromMap(x as Map<String, dynamic>),
              ),
            ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Category(title: $title, id: $id, articleId: $articleId, createdAt: $createdAt, orderId: $orderId, sections: $sections)';
  }

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.id == id &&
        other.articleId == articleId &&
        other.createdAt == createdAt &&
        other.orderId == orderId &&
        listEquals(other.sections, sections);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        id.hashCode ^
        articleId.hashCode ^
        createdAt.hashCode ^
        orderId.hashCode ^
        sections.hashCode;
  }
}

class Section {
  String title;
  String id;
  DateTime createdAt;
  int orderId;
  String categoryId;
  bool premium;
  List<Subsection> subsections;
  String articleId;

  Section({
    required String? id,
    required DateTime? createdAt,
    required this.title,
    required this.orderId,
    required this.categoryId,
    required this.premium,
    required this.subsections,
    required this.articleId,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now().toUtc();

  Section copyWith({
    String? title,
    String? id,
    DateTime? createdAt,
    int? orderId,
    String? categoryId,
    bool? premium,
    List<Subsection>? subsections,
  }) {
    return Section(
      title: title ?? this.title,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      orderId: orderId ?? this.orderId,
      categoryId: categoryId ?? this.categoryId,
      premium: premium ?? this.premium,
      subsections: subsections ?? this.subsections,
      articleId: articleId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ModelValues.title: title,
      ModelValues.id: id,
      ModelValues.createdAt: createdAt.millisecondsSinceEpoch,
      ModelValues.orderId: orderId,
      ModelValues.categoryId: categoryId,
      ModelValues.premium: premium,
      ModelValues.subsections: subsections.map((x) => x.toMap()).toList(),
      ModelValues.articleId: articleId,
    };
  }

  factory Section.fromMap(Map<String, dynamic> map) {
    return Section(
      title: map[ModelValues.title] as String,
      id: map[ModelValues.id] as String,
      createdAt: DateTime.tryParse(map[ModelValues.createdAt]),
      orderId: map[ModelValues.orderId] as int,
      categoryId: map[ModelValues.categoryId] as String,
      premium: map[ModelValues.premium] as bool,
      subsections: map[ModelValues.subsections] == null
          ? []
          : List<Subsection>.from(
              (map[ModelValues.subsections] as List<dynamic>).map<Subsection>(
                (x) => Subsection.fromMap(x as Map<String, dynamic>),
              ),
            ),
      articleId: map[ModelValues.articleId] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Section.fromJson(String source) =>
      Section.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Section(title: $title, id: $id, createdAt: $createdAt, orderId: $orderId, categoryId: $categoryId, premium: $premium, subsections: $subsections)';
  }

  @override
  bool operator ==(covariant Section other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.orderId == orderId &&
        other.categoryId == categoryId &&
        other.premium == premium &&
        listEquals(other.subsections, subsections);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        id.hashCode ^
        createdAt.hashCode ^
        orderId.hashCode ^
        categoryId.hashCode ^
        premium.hashCode ^
        subsections.hashCode;
  }
}

class Subsection {
  String title;
  String id;
  String data;
  DateTime createdAt;
  int orderId;
  String categoryId;
  String sectionId;
  String articleId;

  Subsection(
      {required String? id,
      required DateTime? createdAt,
      required this.title,
      required this.data,
      required this.orderId,
      required this.categoryId,
      required this.sectionId,
      required this.articleId})
      : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now().toUtc();

  Subsection copyWith({
    String? title,
    String? id,
    String? data,
    DateTime? createdAt,
    int? orderId,
    String? categoryId,
    String? sectionId,
  }) {
    return Subsection(
      articleId: articleId,
      title: title ?? this.title,
      id: id ?? this.id,
      data: data ?? this.data,
      createdAt: createdAt ?? this.createdAt,
      orderId: orderId ?? this.orderId,
      categoryId: categoryId ?? this.categoryId,
      sectionId: sectionId ?? this.sectionId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ModelValues.title: title,
      ModelValues.id: id,
      ModelValues.data: data,
      ModelValues.createdAt: createdAt.millisecondsSinceEpoch,
      ModelValues.orderId: orderId,
      ModelValues.categoryId: categoryId,
      ModelValues.sectionId: sectionId,
      ModelValues.articleId: articleId,
    };
  }

  factory Subsection.fromMap(Map<String, dynamic> map) {
    return Subsection(
      articleId: map[ModelValues.articleId] ?? '',
      title: map[ModelValues.title] ?? '',
      id: map[ModelValues.id] ?? '',
      data: map[ModelValues.data] ?? '',
      createdAt: DateTime.tryParse(map[ModelValues.createdAt]),
      orderId: map[ModelValues.orderId] as int,
      categoryId: map[ModelValues.categoryId] as String,
      sectionId: map[ModelValues.sectionId] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Subsection.fromJson(String source) =>
      Subsection.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Subsection(title: $title, id: $id, data: $data, createdAt: $createdAt, orderId: $orderId, categoryId: $categoryId, sectionId: $sectionId)';
  }

  @override
  bool operator ==(covariant Subsection other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.id == id &&
        other.data == data &&
        other.createdAt == createdAt &&
        other.orderId == orderId &&
        other.categoryId == categoryId &&
        other.sectionId == sectionId;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        id.hashCode ^
        data.hashCode ^
        createdAt.hashCode ^
        orderId.hashCode ^
        categoryId.hashCode ^
        sectionId.hashCode;
  }
}

// Example usage:

