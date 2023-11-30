import 'package:data_entery/data/repositories/app_data_repo.dart';
import 'package:data_entery/data/repositories/implementation/database_implementation.dart';
import 'package:data_entery/data/repositories/implementation/local_app_data.dart';
import 'package:data_entery/data/repositories/implementation/remote_app_data.dart';
import 'package:data_entery/providers/conectivity_provider.dart';
import 'package:data_entery/providers/database.dart';
import 'package:data_entery/providers/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localDatabase = LocalDatabase(database);
final appDataRepoProvider = FutureProvider<AppDataRepo>((ref) async {
  final connectivityResult = await ref.watch(connectivityProvider.future);

  return AppDataRepo(
    localAppData: LocalAppDataSource(database),
    remoteAppData: RemoteAppDataSource(
      supabase,
      database,
    ),
    connectivityResult: connectivityResult,
  );
});
