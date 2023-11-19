import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'model.dart';

class MedicalBranch {
  String title;
  List<MedicalContent> sections;
  MedicalBranch({
    required this.title,
    required this.sections,
  });

  MedicalBranch copyWith({
    String? title,
    List<MedicalContent>? sections,
  }) {
    return MedicalBranch(
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

  factory MedicalBranch.fromMap(Map<String, dynamic> map) {
    return MedicalBranch(
      title: map['title'] as String,
      sections: List<MedicalContent>.from(
        (map['sections'] as List<dynamic>).map<MedicalContent>(
          (x) => MedicalContent.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicalBranch.fromJson(String source) =>
      MedicalBranch.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MedicalBranch(title: $title, sections: $sections)';

  @override
  bool operator ==(covariant MedicalBranch other) {
    if (identical(this, other)) return true;

    return other.title == title && listEquals(other.sections, sections);
  }

  @override
  int get hashCode => title.hashCode ^ sections.hashCode;
}
