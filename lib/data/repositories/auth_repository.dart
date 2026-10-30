import '../datasources/supabase_service.dart';
import '../models/user_model.dart';

class AuthRepository {
  final SupabaseService _supabaseService;

  AuthRepository(this._supabaseService);

  // Get current user id
  String? get currentUserId => _supabaseService.currentUserId;

  // Check if logged in
  bool get isUserLoggedIn => _supabaseService.isUserLoggedIn;

  // Sign out method
  Future<void> signOut() async {
    await _supabaseService.client.auth.signOut();
  }
}
