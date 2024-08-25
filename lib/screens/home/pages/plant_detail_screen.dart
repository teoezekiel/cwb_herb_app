import 'package:flutter/material.dart';

class PlantDetailScreen extends StatelessWidget {
  final String plantName;
  final String plantImage;

  const PlantDetailScreen({Key? key, required this.plantName, required this.plantImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plantName),
        backgroundColor: const Color(0xFFB9F6CA),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 300,
                  height: 300,
                  color: Colors.grey[200], // Placeholder color while loading
                  child: Image.network(
                    plantImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              plantName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "All descriptions will be the same, what will you do Isaac?? Do something!!!",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
