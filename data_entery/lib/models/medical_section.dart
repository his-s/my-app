import 'dart:convert';

class MedicalSection {
  String title;
  String data;

  MedicalSection({
    required this.title,
    required this.data,
  });

  MedicalSection copyWith({
    String? title,
    String? data,
  }) {
    return MedicalSection(
      title: title ?? this.title,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'data': data,
    };
  }

  factory MedicalSection.fromMap(Map<String, dynamic> map) {
    return MedicalSection(
      title: map['title'] as String,
      data: map['data'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicalSection.fromJson(String source) =>
      MedicalSection.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MedicalSection(title: $title, data: $data)';

  @override
  bool operator ==(covariant MedicalSection other) {
    if (identical(this, other)) return true;

    return other.title == title && other.data == data;
  }

  @override
  int get hashCode => title.hashCode ^ data.hashCode;
}
