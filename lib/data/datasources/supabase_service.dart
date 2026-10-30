import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/constants/supabase_constants.dart';

class SupabaseService {
  final SupabaseClient client = Supabase.instance.client;

  // Get current user id
  String? get currentUserId => client.auth.currentUser?.id;

  // Check if user is logged in
  bool get isUserLoggedIn => client.auth.currentUser != null;

  // Generic fetch method for tables
  Future<List>> fetchData(String tableName) async {
    final response = await client.from(tableName).select();
    return List>.from(response);
  }
}
