import 'package:flutter/material.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          PostWidget(
            username: 'Josephine',
            handle: '@josephiejojo',
            caption: 'posted an article',
            title: 'Global Health Concerns',
            description: 'Systematic Review of Major Cardiovascular Risk Factors',
            likes: 519,
            comments: 10,
            isVideo: false,
          ),
          PostWidget(
            username: 'Farita Smith',
            handle: '@SmithFa',
            caption: 'posted a video',
            title: 'IMPORTANCE OF TELEMEDICINE',
            description: 'Accessible; Anytime, Anywhere',
            likes: 10,
            comments: 2,
            isVideo: true,
          ),
        ],
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final String username;
  final String handle;
  final String caption;
  final String title;
  final String description;
  final int likes;
  final int comments;
  final bool isVideo;

  const PostWidget({super.key,
    required this.username,
    required this.handle,
    required this.caption,
    required this.title,
    required this.description,
    required this.likes,
    required this.comments,
    required this.isVideo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Text(username[0]),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(handle, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(caption, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),
            isVideo ? buildVideoPost() : buildArticlePost(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.comment, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text('$comments Comments'),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.thumb_up, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text('$likes Likes'),
                  ],
                ),
                const Icon(Icons.share, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildArticlePost() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            color: Colors.grey[800],
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            color: Colors.grey[300],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    description,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                const Icon(Icons.favorite, color: Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildVideoPost() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Image.asset(
                  'assets/images/community_videocover.png',
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned.fill(
                child: Center(
                  child: Icon(Icons.play_circle_fill, color: Colors.white, size: 50),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            color: Colors.grey[300],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.replay_10, color: Colors.black),
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                ),
                const Text(
                  '00:00 / 03:00',
                  style: TextStyle(color: Colors.black),
                ),
                IconButton(
                  icon: const Icon(Icons.forward_10, color: Colors.black),
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
