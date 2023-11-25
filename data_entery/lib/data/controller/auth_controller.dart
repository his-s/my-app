import 'package:data_entery/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController {
  AuthController(
    this._supabase,
  );
  final Supabase _supabase;

  createUser(
    AuthResponse response,
  ) async {
    await _supabase.client.from('users').upsert(
          AppUser(
            name: response.user?.userMetadata?['username'],
            id: response.user!.id,
            premium: false,
            email: response.user!.email!,
          ).toMap(),
        );
  }
}
