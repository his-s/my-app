// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'topic.dart';

class Book {
  String title;
  List<Topic> topics;

  Book({
    required this.title,
    required this.topics,
  });

  Book copyWith({
    String? title,
    List<Topic>? topics,
  }) {
    return Book(
      title: title ?? this.title,
      topics: topics ?? this.topics,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'topics': topics.map((x) => x.toMap()).toList(),
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      title: map['title'] as String,
      topics: List<Topic>.from(
        (map['topics'] as List<dynamic>).map<Topic>(
          (x) => Topic.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) =>
      Book.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Book(title: $title, topics: $topics)';

  @override
  bool operator ==(covariant Book other) {
    if (identical(this, other)) return true;

    return other.title == title && listEquals(other.topics, topics);
  }

  @override
  int get hashCode => title.hashCode ^ topics.hashCode;
}
