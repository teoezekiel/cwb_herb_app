import 'package:flutter/material.dart';
import 'plant_info_screen.dart';
import 'cart_screen.dart';

class TakeCareScreen extends StatefulWidget {
  const TakeCareScreen({super.key});

  @override
  _TakeCareScreenState createState() => _TakeCareScreenState();
}

class _TakeCareScreenState extends State<TakeCareScreen> {

  final List<Map<String, String>> plants = [
    {'name': 'Jasmine', 'image': 'assets/images/Jasmine.png'},
    {'name': 'Jasmine Plant', 'image': 'assets/images/Jasmine_plant.png'},
    {'name': 'Ylang Ylang', 'image': 'assets/images/Ylang_Ylang.png'},
    {'name': 'Champak', 'image': 'assets/images/Champak.png'},
    {'name': 'Red frangipani', 'image': 'assets/images/Red_frangipani.png'},
    {'name': 'Pink frangipani', 'image': 'assets/images/Pink_frangipani.png'},
    {'name': 'White frangipani', 'image': 'assets/images/White_frangipani.png'},
    {'name': 'Purple frangipani', 'image': 'assets/images/Purple_frangipani.png'},
    // Add more plants as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffacd4b2),
      appBar: AppBar(
        backgroundColor: const Color(0xffacd4b2),
        title: const Text("Plant Guide",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
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
              const SizedBox(height: 0),
              Wrap(
                spacing: 8, // horizontal spacing between items
                runSpacing: 12, // vertical spacing between rows
                children: List.generate(plants.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlantInfoScreen(
                            plantName: plants[index]['name']!,
                            plantImage: plants[index]['image']!,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            plants[index]['image']!,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 60, // Fixed width to align text
                          child: Text(
                            plants[index]['name']!,
                            style: const TextStyle(fontSize: 13),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
