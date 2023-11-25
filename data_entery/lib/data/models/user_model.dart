import 'dart:convert';
import 'values.dart';

class AppUser {
  String? name;
  String id;
  String? tel;
  String? activationCode;
  bool premium;
  DateTime? createdAt;
  DateTime? subscribedAt;
  String email;
  int? time;
  AppUser({
    this.name,
    required this.id,
    this.tel,
    this.activationCode,
    required this.premium,
    this.createdAt,
    this.subscribedAt,
    required this.email,
    this.time,
  });

  AppUser.empty()
      : id = '',
        email = '',
        premium = false;
  AppUser copyWith({
    String? name,
    String? id,
    String? tel,
    String? activationCode,
    bool? premium,
    DateTime? createdAt,
    DateTime? subscribedAt,
    String? email,
    int? time,
  }) {
    return AppUser(
      name: name ?? this.name,
      id: id ?? this.id,
      tel: tel ?? this.tel,
      activationCode: activationCode ?? this.activationCode,
      premium: premium ?? this.premium,
      createdAt: createdAt ?? this.createdAt,
      subscribedAt: subscribedAt ?? this.subscribedAt,
      email: email ?? this.email,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ModelValues.name: name,
      ModelValues.id: id,
      ModelValues.tel: tel,
      ModelValues.activationCode: activationCode,
      ModelValues.premium: premium,
      ModelValues.createdAt: createdAt?.toIso8601String(),
      ModelValues.subscribedAt: subscribedAt?.toIso8601String(),
      ModelValues.email: email,
      ModelValues.time: time,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
        name: map[ModelValues.name] as String,
        id: map[ModelValues.id] as String,
        tel: map[ModelValues.tel] ?? '',
        activationCode: map[ModelValues.activationCode] ?? '',
        premium: map[ModelValues.premium] as bool,
        createdAt: DateTime.tryParse(map[ModelValues.createdAt] ?? ''),
        subscribedAt: DateTime.tryParse(map[ModelValues.subscribedAt] ?? ''),
        email: map[ModelValues.email],
        time: map[ModelValues.time]);
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(name: $name, id: $id, tel: $tel, activationCode: $activationCode, premium: $premium, createdAt: $createdAt, subscribedAt: $subscribedAt)';
  }

  @override
  bool operator ==(covariant AppUser other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.id == id &&
        other.tel == tel &&
        other.activationCode == activationCode &&
        other.premium == premium &&
        other.createdAt == createdAt &&
        other.subscribedAt == subscribedAt;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        id.hashCode ^
        tel.hashCode ^
        activationCode.hashCode ^
        premium.hashCode ^
        createdAt.hashCode ^
        subscribedAt.hashCode;
  }
}
