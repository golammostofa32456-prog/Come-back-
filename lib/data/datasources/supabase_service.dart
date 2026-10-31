import 'package:supabase_flutter/supabase_flutter.dart';
// নোট: supabase_constants.dart এখানে ব্যবহার হচ্ছে না, তাই এটি রিমুভ করা হয়েছে। 
// তবে আপনার অন্য কোথাও লাগলে রাখতে পারেন, এটি এরর দিবে না, শুধু ওয়ার্নিং দিবে।

class SupabaseService {
  final SupabaseClient client = Supabase.instance.client;

  // Get current user id
  String? get currentUserId => client.auth.currentUser?.id;

  // Check if user is logged in
  bool get isUserLoggedIn => client.auth.currentUser != null;

  // Generic fetch method for tables
  // নিচের লাইনে List>> এর জায়গায় List<Map<String, dynamic>> বসানো হয়েছে
  Future<List<Map<String, dynamic>>> fetchData(String tableName) async {
    final response = await client.from(tableName).select();
    // response নিজেই একটি List<Map<String, dynamic>> রিটার্ন করে
    return response; 
  }
}
