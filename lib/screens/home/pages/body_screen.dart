import 'dart:async';

import 'package:flutter/material.dart';

import '/routing/routes.dart'; // Import your routes.dart file here
import 'cart_screen.dart';
import 'culture_of_flower_screen.dart';
import 'favorite_screen.dart';
import 'inbox_screen.dart';
import 'knowledge_screen.dart';
import 'plant_detail_screen.dart';
import 'profile_screen.dart';
import 'take_care_screen.dart';

class BodyScreen extends StatefulWidget {
  const BodyScreen({Key? key}) : super(key: key);

  @override
  _BodyScreenState createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  Timer? _timer;
  TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Body Screen'),
    TakeCareScreen(),
    KnowledgeScreen(),
    InboxScreen(),
    ProfileScreen(),
  ];

 // Sample plant data
  static const List<Map<String, String>> plants = [
  {
    "name": "Noni",
    "image": "assets/images/noni.jpg"
  },
  {
    "name": "Bonsai",
    "image": "assets/images/bonsai.jpg"
  },
  {
    "name": "Moringa",
    "image": "assets/images/moringa.jpg"
  },
  {
    "name": "Mint",
    "image": "assets/images/mint.jpg"
  },
  {
    "name": "Celery",
    "image": "assets/images/celery.jpg"
  }
];

  // Notify images data
static const List<String> notifyImages = [
  "assets/images/plant_event_1.jpg",
  "assets/images/plant_event_2.jpg",
  "assets/images/plant_event_3.jpg",
  "assets/images/plant_event_4.jpg"
];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.page == notifyImages.length - 1) {
        _pageController.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      } else {
        _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _navigateToPlantDetail(BuildContext context, String name, String image) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlantDetailScreen(plantName: name, plantImage: image),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffacd4b2),
      // Removed appBar and bottomNavigationBar properties here

      //Kai added appBar
      appBar: AppBar(
        backgroundColor: const Color(0xffacd4b2),
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.jpg'),
              radius: 20,
            ),
            SizedBox(width: 8),
            Text(
              "Green Sprout",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()), // Removed const
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoriteScreen()),
              );
            },
          ),
        ],
      ),
      body: Scrollbar(
        thumbVisibility: true,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                SizedBox(
                  height: 39,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildHeaderButton(context, "How to take care?", Routes.takeCareScreen),
                      _buildHeaderButton(context, "How to cook?", Routes.cookScreen),
                      _buildHeaderButton(context, "Traditional Knowledge", Routes.knowledgeScreen),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                  const Text(
                    "Notify",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 0),
                  SizedBox(
                    height: 230,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: notifyImages.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => InboxScreen()),
                            );
                          },
                          child: _buildStyledContainer(
                            imageUrl: notifyImages[index], // Use the local image path
                            title: '',
                          ),
                        );
                      },
                    ),
                  ),
                  
                const SizedBox(height: 5),
                const Text(
                  "Explore Plants",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 100, // Adjust the height as needed
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: plants.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => _navigateToPlantDetail(
                          context,
                          plants[index]["name"]!,
                          plants[index]["image"]!,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 70, // Adjust the width to control the image size
                                height: 70, // Adjust the height to control the image size
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(plants[index]["image"]!), // Load local image
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(plants[index]["name"]!),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const KnowledgeScreen()),
                      );
                    },
                    child: _buildStyledContainer(
                      imageUrl: "assets/images/traditional_knowledge.jpg", // Local image path
                      title: "",
                    ),
                  ),
                  const SizedBox(height: 0),
                  const Text(
                    "Learn Traditional Knowledge",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 0),
                  const Text(
                    "Study and collect traditional knowledge around",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CultureOfFlowerScreen()),
                    );
                  },
                  child: _buildStyledContainer(
                    imageUrl: "assets/images/culture_of_flowers.jpg", // Local image path
                    title: "",
                  ),
                ),
                const SizedBox(height: 0),
                const Text(
                  "Culture of Flowers",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 0),
                const Text(
                  "Let’s find culture of flowers",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildStyledContainer(
                            imageUrl: "assets/images/workshop.jpg", // Local image path
                            title: "",
                          ),
                          const SizedBox(height: 0),
                          const Text(
                            "Workshop",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 0),
                          const Text(
                            "Gather and collect",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildStyledContainer(
                            imageUrl: "assets/images/foyer.png", // Local image path
                            title: "",
                          ),
                          const SizedBox(height: 0),
                          const Text(
                            "Foyer",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 0),
                          const Text(
                            "About foyer etc...",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            onSubmitted: (query) {
                              // Implement your search logic here
                              print('Search query: $query');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderButton(BuildContext context, String title, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildStyledContainer({required String imageUrl, required String title}) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
        ),
        if (title.isNotEmpty)
          Positioned(
            bottom: 16,
            left: 16,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
