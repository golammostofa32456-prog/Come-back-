import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/constants/supabase_constants.dart';
import 'core/theme/app_theme.dart';
import 'core/services/injection_container.dart'; // এটি নতুন যোগ করা হয়েছে
import 'presentation/screens/video_feed_screen.dart';

void main() async {
  // Flutter ইঞ্জিন ইনিশিয়ালাইজ করা
  WidgetsFlutterBinding.ensureInitialized();

  // Supabase ইনিশিয়ালাইজ করা
  await Supabase.initialize(
    url: SupabaseConstants.supabaseUrl,
    anonKey: SupabaseConstants.supabaseAnonKey,
  );

  // GetIt (Dependency Injection) ইনিশিয়ালাইজ করা
  // এটি অবশ্যই runApp এর আগে কল করতে হবে
  await initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok Video App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      // এখানে আপনার VideoFeedScreen হোম স্ক্রিন হিসেবে সেট করা আছে
      home: const VideoFeedScreen(), 
    );
  }
}
