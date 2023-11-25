import 'dart:developer';
import 'package:data_entery/data/controller/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart'
    show AuthResponse, Supabase, User;
import '../state/auth_state.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(this._supabase, this._service) : super(AuthState.empty());
  final AuthController _service;
  final Supabase _supabase;

  Future<void> isUserHere() async {
    if (_supabase.client.auth.currentUser != null) {
      state = state.copyWith(
          isLoggedIn: true, id: _supabase.client.auth.currentUser!.id);
    } else {
      state = AuthState.empty();
    }
  }

  signUp(AuthResponse response) async {
    try {
      if (response.user != null) {
        state = state.copyWith(
            isLoggedIn: true, id: response.user!.id, user: response.user);
        await _service.createUser(response);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  signIn(AuthResponse response) {
    try {
      if (response.user != null) {
        state = state.copyWith(
          isLoggedIn: true,
          id: response.user!.id,
          user: response.user,
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> logOut() async {
    try {
      await _supabase.client.auth.signOut();
      state = state.copyWith(isLoggedIn: false, id: '', user: null);
    } catch (e) {
      log(e.toString());
    }
  }

  User? get currentUser => _supabase.client.auth.currentUser;
  bool get user {
    if (currentUser != null) {
      return true;
    } else {
      return false;
    }
  }
}
