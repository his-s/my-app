import 'package:data_entery/data/models/code_model.dart';
import 'package:data_entery/data/notifiers/subscriptation_notifier.dart';
import 'package:data_entery/providers/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final subscriptionProvider =
    StateNotifierProvider<SubscriptionNotifier, Code>((ref) {
  return SubscriptionNotifier(supabase);
});
