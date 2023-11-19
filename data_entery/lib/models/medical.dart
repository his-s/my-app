import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'model.dart';

class Medical {
  String title;
  List<MedicalContent> sections;
  Medical({
    required this.title,
    required this.sections,
  });

  Medical copyWith({
    String? title,
    List<MedicalContent>? sections,
  }) {
    return Medical(
      title: title ?? this.title,
      sections: sections ?? this.sections,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'sections': sections.map((x) => x.toMap()).toList(),
    };
  }

  factory Medical.fromMap(Map<String, dynamic> map) {
    return Medical(
      title: map['title'] as String,
      sections: List<MedicalContent>.from(
        (map['sections'] as List<dynamic>).map<MedicalContent>(
          (x) => MedicalContent.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Medical.fromJson(String source) =>
      Medical.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Medical(title: $title, sections: $sections)';

  @override
  bool operator ==(covariant Medical other) {
    if (identical(this, other)) return true;

    return other.title == title && listEquals(other.sections, sections);
  }

  @override
  int get hashCode => title.hashCode ^ sections.hashCode;
}
