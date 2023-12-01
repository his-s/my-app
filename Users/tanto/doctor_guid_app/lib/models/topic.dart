// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Topic {
  String title;
  List<int> index;
  List<String> images;

  Topic({
    required this.title,
    required this.index,
    required this.images,
  });

  Topic copyWith({
    String? title,
    List<int>? index,
    List<String>? images,
  }) {
    return Topic(
      title: title ?? this.title,
      index: index ?? this.index,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'index': index,
      'images': images,
    };
  }

  factory Topic.fromMap(Map<String, dynamic> map) {
    return Topic(
      title: map['title'] ?? '' as String,
      index: List<int>.from(
        (map['index'] ?? [] as List<dynamic>),
      ),
      images: List<String>.from(
        (map['images'] ?? [] as List<dynamic>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Topic.fromJson(String source) =>
      Topic.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Topic(title: $title, index: $index, images: $images)';

  @override
  bool operator ==(covariant Topic other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.index == index &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode => title.hashCode ^ index.hashCode ^ images.hashCode;
}
