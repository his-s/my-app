import 'package:data_entery/data/models/user_model.dart';
import 'package:data_entery/data/notifiers/user_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'supabase_provider.dart';

final userStateProvider = StateNotifierProvider<UserStateNotifer, AppUser>(
  (ref) => UserStateNotifer(supabase, ref),
);
