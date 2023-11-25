import 'package:data_entery/data/models/code_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SubscriptionNotifier extends StateNotifier<Code> {
  final Supabase _supabase;
  SubscriptionNotifier(this._supabase) : super(Code());
  Future<void> checkCode(String code) async {
    try {
      if (code.isNotEmpty) {
        List<dynamic> data = await _supabase.client
            .from('codes')
            .select('*')
            .eq('code', code.trim())
            .limit(1);
        state = Code.fromJson(data.first);
      }
    } catch (e) {
      state = Code(isAvailable: false);
    }
  }

  Future<void> unlockCode(String userId) async {
    try {
      await _supabase.client
          .from('codes')
          .update(state
              .copyWith(
                isAvailable: false,
                userId: userId,
              )
              .toJson())
          .eq('code', state.code);
    } catch (e) {}
  }

  void resetCode() {
    state = Code();
  }
}
