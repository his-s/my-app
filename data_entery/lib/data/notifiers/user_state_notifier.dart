import 'package:data_entery/data/models/code_model.dart';
import 'package:data_entery/data/models/model.dart';
import 'package:data_entery/providers/auth_provider.dart';
import 'package:data_entery/providers/subcription_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserStateNotifer extends StateNotifier<AppUser> {
  final Supabase _supabase;
  final StateNotifierProviderRef ref;
  UserStateNotifer(this._supabase, this.ref) : super(AppUser.empty());

  Future<void> getUser() async {
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

  void resetUser() {
    state = AppUser.empty();
  }

  Future<void> unlockUserPremium(Code code, String tel) async {
    try {
      await _supabase.client
          .from('users')
          .update(
            appUser
                .copyWith(
                  activationCode: code.code,
                  tel: tel.trim(),
                  premium: true,
                  subscribedAt: DateTime.now(),
                  id: state.id,
                  time: code.subscriptionMonths,
                )
                .toMap(),
          )
          .eq('id', appUser.id);
      // this will give this user this code
      await ref.read(subscriptionProvider.notifier).unlockCode(state.id);
    } catch (e) {}
  }

  AppUser get appUser => state;
}
