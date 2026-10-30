import 'package:flutter/material.dart';

class VideoFeedScreen extends StatelessWidget {
  const VideoFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Center(
                child: Text(
                  'Video Feed Item ${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                right: 16,
                bottom: 100,
                child: Column(
                  children: const [
                    IconButton(
                      icon: Icon(Icons.favorite, color: Colors.white, size: 35),
                      onPressed: null,
                    ),
                    SizedBox(height: 20),
                    IconButton(
                      icon: Icon(Icons.comment, color: Colors.white, size: 35),
                      onPressed: null,
                    ),
                    SizedBox(height: 20),
                    IconButton(
                      icon: Icon(Icons.share, color: Colors.white, size: 35),
                      onPressed: null,
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
