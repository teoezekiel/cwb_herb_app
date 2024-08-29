import 'package:flutter/material.dart';

class CookingWaysScreen extends StatefulWidget {
  final List<String> imagePaths;
  final String title;
  final String content;
  final String author;

  const CookingWaysScreen({
    Key? key,
    required this.imagePaths,
    required this.title,
    required this.content,
    required this.author,
  }) : super(key: key);

  @override
  _CookingWaysScreenState createState() => _CookingWaysScreenState();
}

class _CookingWaysScreenState extends State<CookingWaysScreen> {
  bool isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffacd4b2),
      appBar: AppBar(
        backgroundColor: const Color(0xffacd4b2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(widget.title, style: const TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Myanmar') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CookingWaysScreen(
                      imagePaths: widget.imagePaths,
                      title: '${widget.title}',
                      content: 'This is Myanmar\'s cooking way content.',
                      author: widget.author,
                    ),
                  ),
                );
              } else if (value == 'Cambodia') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CookingWaysScreen(
                      imagePaths: widget.imagePaths,
                      title: '${widget.title}',
                      content: 'This is Cambodia\'s cooking way content.',
                      author: widget.author,
                    ),
                  ),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Myanmar', 'Cambodia'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: widget.imagePaths.map((path) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            path, // Using Image.asset for local images
                            fit: BoxFit.cover,
                            width: 150,
                            height: 150,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'How to cook ${widget.title}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.author,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(1),
                child: IconButton(
                  icon: Icon(
                    isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: isFavorited ? Colors.red : Colors.black,
                  ),
                  onPressed: _toggleFavorite,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.content,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
