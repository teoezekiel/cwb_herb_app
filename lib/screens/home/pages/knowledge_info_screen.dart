import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class KnowledgeInfoScreen extends StatelessWidget {
  final String category;

  const KnowledgeInfoScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> videos = _getVideosForCategory(category);

    return Scaffold(
      backgroundColor: const Color(0xffacd4b2),
      appBar: AppBar(
        title: Text('$category Remedies'),
        backgroundColor: const Color(0xffacd4b2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: List.generate(videos.length, (index) {
            final video = videos[index];
            return VideoSection(
              imagePath: video['thumbnail']!,
              title: video['title']!,
              shortDescription: video['short_description']!,
              onPlayPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoInfoScreen(
                      imagePath: video['thumbnail']!,
                      title: video['title']!,
                      date: video['date']!,
                      description: video['description']!,
                      videoUrl: video['videoUrl']!,
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }

  List<Map<String, String>> _getVideosForCategory(String category) {
    switch (category) {
      case 'Fever':
        return [
          {
            'thumbnail': 'assets/images/vd_thmb_1.jpg',
            'title': 'Fever Remedy 1',
            'date': '21.8.2024',
            'short_description': 'Natural fever remedy.',
            'description': 'This is a long description for this plant.',
            'videoUrl': 'assets/videos/moti.mp4'
          },
          {
            'thumbnail': 'assets/images/vd_thmb_2.jpg',
            'title': 'Fever Remedy 2',
            'date': '21.8.2024',
            'short_description': 'Natural fever remedy.',
            'description': 'This is a long description for this plant.',
            'videoUrl': 'assets/videos/moti.mp4'
          },
        ];
        case 'Headache':
        return [
          {
            'thumbnail': 'assets/images/vd_thmb_3.jpg',
            'title': 'Headache Remedy 1',
            'date': '21.8.2024',
            'short_description': 'Natural Headache remedy.',
            'description': 'This is a long description for this plant.',
            'videoUrl': 'assets/videos/moti.mp4'
          },
          {
            'thumbnail': 'assets/images/vd_thmb_4.jpg',
            'title': 'Headache Remedy 2',
            'date': '21.8.2024',
            'short_description': 'Natural Headache remedy.',
            'description': 'This is a long description for this plant.',
            'videoUrl': 'assets/videos/moti.mp4'
          },
        ];
        case 'Stomach Pain':
        return [
          {
            'thumbnail': 'assets/images/vd_thmb_1.jpg',
            'title': 'Stomach Pain Remedy 1',
            'date': '21.8.2024',
            'short_description': 'Natural Stomach Pain remedy.',
            'description': 'This is a long description for this plant.',
            'videoUrl': 'assets/videos/moti.mp4'
          },
          {
            'thumbnail': 'assets/images/vd_thmb_2.jpg',
            'title': 'Stomach Pain Remedy 2',
            'date': '21.8.2024',
            'short_description': 'Natural Stomach Pain remedy.',
            'description': 'This is a long description for this plant.',
            'videoUrl': 'assets/videos/moti.mp4'
          },
        ];
        case 'Fever':
        return [
          {
            'thumbnail': 'assets/images/vd_thmb_3.jpg',
            'title': 'Fever Remedy 1',
            'date': '21.8.2024',
            'short_description': 'Natural fever remedy.',
            'description': 'This is a long description for this plant.',
            'videoUrl': 'assets/videos/moti.mp4'
          },
          {
            'thumbnail': 'assets/images/vd_thmb_4.jpg',
            'title': 'Fever Remedy 2',
            'date': '21.8.2024',
            'short_description': 'Natural fever remedy.',
            'description': 'This is a long description for this plant.',
            'videoUrl': 'assets/videos/moti.mp4'
          },
        ];
      default:
        return [];
    }
  }
}

class VideoSection extends StatelessWidget {
  final String imagePath;
  final String title;
  final String shortDescription;
  final VoidCallback onPlayPressed;

  const VideoSection({
    required this.imagePath,
    required this.title,
    required this.shortDescription,
    required this.onPlayPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.asset(
                  imagePath,
                  height: 120.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: onPlayPressed,
                child: Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.green,
                    size: 24.0,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.0),
                Text(
                  shortDescription,
                  style: TextStyle(fontSize: 11.0, color: Colors.grey[700]),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
  final String videoUrl;
  final String title;
  final String date;
  final String description;

  const VideoInfoScreen({
    required this.videoUrl,
    required this.title,
    required this.date,
    required this.description, required String imagePath,
  });

  @override
  _VideoInfoScreenState createState() => _VideoInfoScreenState();
}

class _VideoInfoScreenState extends State<VideoInfoScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _showControls = false;
  Timer? _hideControlsTimer;

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        if (mounted) {
          setState(() {}); // Only call setState if the widget is mounted
          _controller.play();
          setState(() {
            _isPlaying = true;
          });
          _startHideControlsTimer();
        }
      }).catchError((error) {
        print('Error initializing video: $error');
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _hideControlsTimer?.cancel();
    super.dispose();
  }

  void _togglePlayPause() {
    if (mounted) {
      setState(() {
        if (_isPlaying) {
          _controller.pause();
        } else {
          _controller.play();
        }
        _isPlaying = !_isPlaying;
        _resetHideControlsTimer();
      });
    }
  }

  void _skipForward() {
    final newPosition = _controller.value.position + Duration(seconds: 10);
    if (newPosition < _controller.value.duration) {
      _controller.seekTo(newPosition);
    } else {
      _controller.seekTo(_controller.value.duration);
    }
    _resetHideControlsTimer();
  }

  void _skipBackward() {
    final newPosition = _controller.value.position - Duration(seconds: 10);
    if (newPosition > Duration.zero) {
      _controller.seekTo(newPosition);
    } else {
      _controller.seekTo(Duration.zero);
    }
    _resetHideControlsTimer();
  }

  void _startHideControlsTimer() {
    _hideControlsTimer = Timer(Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _showControls = false;
        });
      }
    });
  }

  void _resetHideControlsTimer() {
    _hideControlsTimer?.cancel();
    if (mounted) {
      setState(() {
        _showControls = true;
      });
      _startHideControlsTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffacd4b2),
      appBar: AppBar(
        backgroundColor: const Color(0xffacd4b2),
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              if (mounted) {
                setState(() {
                  _showControls = !_showControls;
                });
              }
              _resetHideControlsTimer();
            },
            child: MouseRegion(
              onEnter: (_) {
                if (mounted) {
                  setState(() {
                    _showControls = true;
                  });
                }
                _resetHideControlsTimer();
              },
              onExit: (_) {
                if (mounted) {
                  setState(() {
                    _showControls = false;
                  });
                }
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.isInitialized
                        ? _controller.value.aspectRatio
                        : 16 / 9,
                    child: _controller.value.isInitialized
                        ? VideoPlayer(_controller)
                        : Center(child: CircularProgressIndicator()),
                  ),
                  if (_showControls)
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 10,
                      child: VideoProgressIndicator(
                        _controller,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                          playedColor: Colors.green,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    ),
                  if (_showControls)
                    Positioned(
                      bottom: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.replay_10, color: Colors.white, size: 30),
                            onPressed: _skipBackward,
                          ),
                          IconButton(
                            icon: Icon(
                              _isPlaying ? Icons.pause : Icons.play_arrow,
                              color: Colors.white,
                              size: 50,
                            ),
                            onPressed: _togglePlayPause,
                          ),
                          IconButton(
                            icon: Icon(Icons.forward_10, color: Colors.white, size: 30),
                            onPressed: _skipForward,
                          ),
                        ],
                      ),
                    ),
                  if (_showControls)
                    Positioned(
                      bottom: 10,
                      left: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _formatDuration(_controller.value.position),
                            style: const TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            _formatDuration(_controller.value.duration),
                            style: const TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  widget.date,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}





