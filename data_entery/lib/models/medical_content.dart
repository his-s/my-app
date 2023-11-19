import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'model.dart';

class MedicalContent {
  String title;
  List<MedicalSection> sections;

  MedicalContent({
    required this.title,
    required this.sections,
  });

  MedicalContent copyWith({
    String? title,
    List<MedicalSection>? sections,
  }) {
    return MedicalContent(
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

  factory MedicalContent.fromMap(Map<String, dynamic> map) {
    return MedicalContent(
      title: map['title'] as String,
      sections: List<MedicalSection>.from(
        (map['sections'] as List<dynamic>).map<MedicalSection>(
          (x) => MedicalSection.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicalContent.fromJson(String source) =>
      MedicalContent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MedicalContent(title: $title, sections: $sections)';

  @override
  bool operator ==(covariant MedicalContent other) {
    if (identical(this, other)) return true;

    return other.title == title && listEquals(other.sections, sections);
  }

  @override
  int get hashCode => title.hashCode ^ sections.hashCode;
}
