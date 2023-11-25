import 'package:supabase_flutter/supabase_flutter.dart';

class AuthState {
  String id;
  bool isLoggedIn;
  User? user;
  AuthState({
    required this.id,
    required this.isLoggedIn,
    required this.user,
  });
  AuthState.empty()
      : id = '',
        isLoggedIn = false;

  AuthState copyWith({
    String? id,
    bool? isLoggedIn,
    User? user,
  }) {
    return AuthState(
      user: user ?? this.user,
      id: id ?? this.id,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}
