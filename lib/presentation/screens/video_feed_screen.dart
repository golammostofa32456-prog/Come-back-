import 'package:flutter/material.dart';

class VideoFeedScreen extends StatelessWidget {
  const VideoFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5, // আপাতত ডেমো হিসেবে ৫টি ভিডিওর পেজ রাখা হলো
        itemBuilder: (context, index) {
          return Stack(
            children: [
              // ভিডিও প্লেয়ার বা ব্যাকগ্রাউন্ড প্লেসহোল্ডার
              Container(
                color: Colors.primaries[index % Colors.primaries.length],
                child: Center(
                  child: Text(
                    'Video Feed ${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // ডানপাশের অ্যাকশন বাটনসমূহ (লাইক, কমেন্ট, শেয়ার)
              Positioned(
                right: 15,
                bottom: 80,
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.white, size: 35),
                      onPressed: () {},
                    ),
                    const Text('12.5K', style: TextStyle(color: Colors.white)),
                    const SizedBox(height: 20),
                    IconButton(
                      icon: const Icon(Icons.comment, color: Colors.white, size: 35),
                      onPressed: () {},
                    ),
                    const Text('1.2K', style: TextStyle(color: Colors.white)),
                    const SizedBox(height: 20),
                    IconButton(
                      icon: const Icon(Icons.share, color: Colors.white, size: 35),
                      onPressed: () {},
                    ),
                    const Text('Share', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              // নিচের দিকে ইউজারের নাম ও ক্যাপশন
              const Positioned(
                left: 15,
                bottom: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '@username',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'This is a sample caption for the video! #flutter #supabase',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
