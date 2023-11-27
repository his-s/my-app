import 'package:data_entery/data/database/database.dart';
import 'package:data_entery/data/repositories/app_data_repo.dart';
import 'package:data_entery/data/repositories/implementation/local_app_data.dart';
import 'package:data_entery/data/repositories/implementation/remote_app_data.dart';
import 'package:data_entery/providers/conectivity_provider.dart';
import 'package:data_entery/providers/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appDataRepoProvider = FutureProvider<AppDataRepo>((ref) async {
  final connectivityResult = await ref.watch(connectivityProvider.future);
  final appDatabase = AppDatabase();
  return AppDataRepo(
      localAppData: LocalAppData(appDatabase),
      remoteAppData: RemoteAppData(supabase, appDatabase),
      connectivityResult: connectivityResult);
});
