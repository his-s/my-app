// ignore_for_file: public_member_api_docs, sort_constructors_first
class Code {
  int? id;
  String? code;
  String? userId;
  String? providerName;
  int? subscriptionMonths;
  double? price;
  DateTime? createdAt;
  bool? isAvailable;

  Code({
    this.id,
    this.code,
    this.userId,
    this.providerName,
    this.subscriptionMonths,
    this.price,
    this.createdAt,
    this.isAvailable,
  });

  factory Code.fromJson(Map<String, dynamic> json) {
    return Code(
      id: json['id'] as int,
      code: json['code'] as String,
      userId: json['user_id'] ?? '',
      providerName: json['provider_name'] ?? '',
      subscriptionMonths: json['subscription_months'] as int,
      price: json['price'] as double,
      createdAt: DateTime.parse(json['created_at'] as String),
      isAvailable: json['is_available'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'user_id': userId,
      'provider_name': providerName,
      'subscription_months': subscriptionMonths,
      'price': price,
      'created_at': createdAt?.toIso8601String(),
      'is_available': isAvailable,
    };
  }

  Code copyWith({
    int? id,
    String? code,
    String? userId,
    String? providerName,
    int? subscriptionMonths,
    double? price,
    DateTime? createdAt,
    bool? isAvailable,
  }) {
    return Code(
      id: id ?? this.id,
      code: code ?? this.code,
      userId: userId ?? this.userId,
      providerName: providerName ?? this.providerName,
      subscriptionMonths: subscriptionMonths ?? this.subscriptionMonths,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}
