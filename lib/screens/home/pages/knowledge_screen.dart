import 'package:flutter/material.dart';
import 'knowledge_info_screen.dart';

class KnowledgeScreen extends StatelessWidget {
  const KnowledgeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffacd4b2),
      appBar: AppBar(
        backgroundColor: const Color(0xffacd4b2),
        title: const Text("Traditional Knowledge",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 0),
            Text(
              'Select a health condition to view traditional knowledge remedies.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  buildGridItem(context, 'assets/images/fever.jpg', 'Fever'),
                  buildGridItem(context, 'assets/images/headache.jpg', 'Headache'),
                  buildGridItem(context, 'assets/images/stomach_pain.jpg', 'Stomach Pain'),
                  buildGridItem(context, 'assets/images/fever_next.jpg', 'Fever'),
                  // Add more conditions here if needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build the grid item and handle navigation
  Widget buildGridItem(BuildContext context, String imagePath, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KnowledgeInfoScreen(category: title), // Pass category name
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 80,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
