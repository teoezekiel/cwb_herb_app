import 'package:flutter/material.dart';
import 'plant_info_screen.dart';

class FavoriteScreen extends StatelessWidget {
  // Example data, replace this with your actual data source
  final List<Map<String, String>> favoritePlants = [
    {'name': 'Jasmine', 'image': 'assets/images/Jasmine.png'},
    {'name': 'Ylang Ylang', 'image': 'assets/images/Ylang_Ylang.png'},
    {'name': 'Champak', 'image': 'assets/images/Champak.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffacd4b2),
      appBar: AppBar(
        title: Text('Favorite Plants'),
        backgroundColor: const Color(0xffacd4b2),
      ),
      body: ListView.builder(
        itemCount: favoritePlants.length,
        itemBuilder: (context, index) {
          final plant = favoritePlants[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0), // Add padding here
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(right: 8.0), // Add padding between image and text
                child: Image.asset(
                  plant['image']!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(plant['name']!),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.blueGrey),
                onPressed: () {
                  // Handle removing the plant from favorites
                  // You might update the state or data source here
                },
              ),
              onTap: () {
                // Handle navigation to plant details if needed
                // For example, you might navigate to a PlantInfoScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlantInfoScreen(
                      plantName: plant['name']!,
                      plantImage: plant['image']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
