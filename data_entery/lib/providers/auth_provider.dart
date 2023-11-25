import 'package:data_entery/data/controller/auth_controller.dart';
import 'package:data_entery/data/notifiers/auth_notifier.dart';
import 'package:data_entery/data/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'supabase_provider.dart';

final currentUser = StateProvider<bool>((ref) {
  final authState = ref.watch(authStateProvider.notifier);
  return authState.currentUser != null;
});

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
    (ref) => AuthStateNotifier(supabase, AuthController(supabase)));
