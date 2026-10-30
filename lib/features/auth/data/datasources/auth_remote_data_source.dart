import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> signUpWithEmailPassword({
    required String email,
    required String password,
  });

  Future<AuthResponse> loginWithEmailPassword({
    required String email,
    required String password,
  });
  
  SupabaseClient get supabaseClient;
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient _supabaseClient;

  AuthRemoteDataSourceImpl(this._supabaseClient);

  @override
  SupabaseClient get supabaseClient => _supabaseClient;

  @override
  Future<AuthResponse> signUpWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return await _supabaseClient.auth.signUp(
      email: email,
      password: password,
    );
  }

  @override
  Future<AuthResponse> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return await _supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }
}
