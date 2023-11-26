import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityProvider = FutureProvider<ConnectivityResult>((ref) async {
  return await Connectivity().checkConnectivity();
});
