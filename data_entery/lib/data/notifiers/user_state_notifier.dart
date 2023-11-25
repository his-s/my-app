import 'package:data_entery/data/models/model.dart';
import 'package:data_entery/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserStateNotifer extends StateNotifier<AppUser> {
  final Supabase _supabase;
  final StateNotifierProviderRef ref;
  UserStateNotifer(this._supabase, this.ref) : super(AppUser.empty());

  getUser() async {
    final user = ref.watch(authStateProvider.notifier).currentUser;
    if (user != null) {
      if (user.id.isNotEmpty) {
        final String userID = user.id;
        List<dynamic> data =
            await _supabase.client.from('users').select('*').eq('id', userID);
        state = AppUser.fromMap(data.first);
      }
    }
  }

  AppUser get appUser => state;
}
