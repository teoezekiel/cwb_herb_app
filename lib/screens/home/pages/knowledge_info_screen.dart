import 'package:flutter/material.dart';
// import 'play_video_screen.dart';

class KnowledgeInfoScreen extends StatelessWidget {
  final String category; // Receive category from previous screen

  const KnowledgeInfoScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Video data based on category
    final List<Map<String, String>> videos = _getVideosForCategory(category);

    return Scaffold(
      backgroundColor: const Color(0xffacd4b2),
      appBar: AppBar(
        title: Text('$category Remedies'), // Show selected category in AppBar
        backgroundColor: const Color(0xffacd4b2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded( // Make GridView take available space
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: List.generate(videos.length, (index) {
                  final video = videos[index];
                  return VideoSection(
                    imagePath: video['thumbnail']!, // Use appropriate video thumbnail
                    title: video['title']!,
                    short_description: video['short_description']!,
                    onPlayPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoInfoScreen(
                            imagePath: video['thumbnail']!,
                            title: video['title']!,
                            date: video['date']!,
                            description: video['description']!,
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to return videos based on category
  List<Map<String, String>> _getVideosForCategory(String category) {
    switch (category) {
      case 'Fever':
        return [
          { 'thumbnail': 'assets/images/vd_thmb_1.jpg',
            'title': 'Fever Remedy 1',
            'date': '21.8.2024',
            'short_description': 'Natural fever remedy.',
            'description': 'This is long description for this plant.'},

          { 'thumbnail': 'assets/images/vd_thmb_2.jpg',
            'title': 'Fever Remedy 2',
            'date': '21.8.2024',
            'short_description': 'Natural fever remedy.',
            'description': 'This is long description for this plant.'},
        ];
      case 'Headache':
        return [
          { 'thumbnail': 'assets/images/vd_thmb_3.jpg',
            'title': 'Headache Remedy 1',
            'date': '21.8.2024',
            'short_description': 'Relief from headaches.',
            'description': 'This is long description for this plant.'},

          { 'thumbnail': 'assets/images/vd_thmb_4.jpg',
            'title': 'Headache Remedy 2',
            'date': '21.8.2024',
            'short_description': 'Relief from headaches.',
            'description': 'This is long description for this plant.'},
        ];
      case 'Stomach Pain':
        return [
          { 'thumbnail': 'assets/images/vd_thmb_1.jpg',
            'title': 'Stomach Pain Remedy 1',
            'date': '21.8.2024',
            'short_description': 'Relief for stomach pain.'
            ,'description': 'This is long description for this plant.'},

          { 'thumbnail': 'assets/images/vd_thmb_2.jpg',
            'title': 'Stomach Pain Remedy 2',
            'date': '21.8.2024',
            'short_description': 'Relief for stomach pain.',
            'description': 'This is long description for this plant.'},
        ];
      default:
        return [];
    }
  }
}


class VideoSection extends StatelessWidget {
  final String imagePath;
  final String title;
  final String short_description;
  final VoidCallback onPlayPressed;

  const VideoSection({
    required this.imagePath,
    required this.title,
    required this.short_description,
    required this.onPlayPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0), // Further reduce the margin
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0), // Slightly reduce the border radius
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6.0, // Reduce the blur radius for shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center, // Center the play button
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0), // Adjust to match container's border radius
                  topRight: Radius.circular(8.0),
                ),
                child: Image.asset(
                  imagePath,
                  height: 90.0, // Further reduce the height of the image
                  width: double.infinity, // Make the image take the full width of the container
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: onPlayPressed,
                child: Container(
                  padding: EdgeInsets.all(6.0), // Reduce padding for the play button
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.7), // Adjust opacity
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.green,
                    size: 20.0, // Reduce size of the play icon
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5.0), // Reduce padding inside the card
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold), // Reduce font size
                  maxLines: 1, // Limit the title to one line
                  overflow: TextOverflow.ellipsis, // Show ellipsis if text overflows
                ),
                SizedBox(height: 2.0), // Slightly reduce the space between title and description
                Text(
                  short_description,
                  style: TextStyle(fontSize: 11.0, color: Colors.grey[700]), // Reduce font size
                  maxLines: 2, // Limit the description to two lines
                  overflow: TextOverflow.ellipsis, // Show ellipsis if text overflows
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VideoInfoScreen extends StatefulWidget {
  final String imagePath;
  final String title;
  final String date;
  final String description;

  const VideoInfoScreen({
    required this.imagePath,
    required this.title,
    required this.date,
    required this.description,
  });

  @override
  _VideoInfoScreenState createState() => _VideoInfoScreenState();
}

class _VideoInfoScreenState extends State<VideoInfoScreen> {
  bool _isFavorite = false; // State to track if the item is favorited

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite; // Toggle the favorite state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffacd4b2),
      appBar: AppBar(
        backgroundColor: const Color(0xffacd4b2),
        title: Text('Video Info', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    widget.imagePath,
                    width: double.infinity,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => PlayVideoScreen(
                    //       videoUrl: '<iframe width="560" height="315" src="https://www.youtube.com/embed/kb2AIfItIVU?si=ftcwjNihg7z1278V" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>', // Replace with your video URL
                    //     ),
                    //   ),
                    // );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.green,
                      size: 50.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              widget.title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.date,
              style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: _isFavorite ? Colors.red : Colors.black,
                  ),
                  onPressed: _toggleFavorite, // Handle favorite button press
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  widget.description,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}