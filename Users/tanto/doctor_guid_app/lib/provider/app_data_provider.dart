import 'package:doctor_guid_app/data/implementation/local_data_source.dart';
import 'package:doctor_guid_app/data/repo/app_data.dart';
import 'package:doctor_guid_app/notifiers/app_data_state_notifier.dart';
import 'package:doctor_guid_app/state/app_data_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appDataProvider =
    StateNotifierProvider<AppDataStateNotifier, AppDataState>((ref) {
  return AppDataStateNotifier(appDataRepo);
});

final LocalDataSource localDataSource = LocalDataSource();

final AppDataRepo appDataRepo = AppDataRepo(localDataSource: localDataSource);
