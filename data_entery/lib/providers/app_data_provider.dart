import 'package:data_entery/data/notifiers/data_state_notifier.dart';
import 'package:data_entery/data/state/app_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'supabase_provider.dart';

final appDataProvider = StateNotifierProvider<AppDataNotifier, AppState>((ref) {
  return AppDataNotifier(supabase);
});
