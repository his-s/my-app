import 'package:data_entery/data/database/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appDatabaseProvider =
    FutureProvider.autoDispose<AppDatabase>((ref) async {
  final database = AppDatabase();
  return database;
});
