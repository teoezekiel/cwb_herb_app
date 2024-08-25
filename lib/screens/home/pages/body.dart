import 'package:flutter/material.dart';
import 'dart:async';

import 'take_care_screen.dart';
import 'cook_screen.dart';
import 'knowledge_screen.dart';
import 'plant_detail_screen.dart';
import 'cart_screen.dart';
import 'culture_of_flower_screen.dart';
import 'favorite_screen.dart';
import 'inbox_screen.dart';
import 'profile_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  Timer? _timer;
  TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController(); // Add ScrollController

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Screen'),
    TakeCareScreen(),
    KnowledgeScreen(),
    InboxScreen(),
    ProfileScreen(),
  ];

  // Sample plant data
  static const List<Map<String, String>> plants = [
    {
      "name": "Noni",
      "image": "https://i.pinimg.com/564x/4f/08/69/4f08697eb6f7a3c26f29ef4884b67e12.jpg"
    },
    {
      "name": "Bonsai",
      "image": "https://i.pinimg.com/564x/b7/89/c6/b789c68039630efa414736d5702d0205.jpg"
    },
    {
      "name": "Moringa",
      "image": "https://i.pinimg.com/564x/6e/01/d0/6e01d0deb0218887b97ec6dbda4b54dc.jpg"
    },
    {
      "name": "Mint",
      "image": "https://i.pinimg.com/564x/16/05/c5/1605c5c53413da6cd647aee8d8f73e2d.jpg"
    },
    {
      "name": "Celery",
      "image": "https://i.pinimg.com/564x/84/63/a8/8463a80cedd33b2b47f14669a61ef1f2.jpg"
    }
  ];

  // Notify images data
  static const List<String> notifyImages = [
    "https://i.pinimg.com/736x/65/61/c2/6561c230f634b67d41d8c140a2f17b5c.jpg",
    "https://i.pinimg.com/736x/7f/f2/82/7ff2828007992e588c7f2a5176771287.jpg",
    "https://i.pinimg.com/564x/75/57/3b/75573b297c2b1fa360d0aea866f9eb58.jpg",
    "https://i.pinimg.com/564x/54/f4/dd/54f4dd420d3a56355f195f60e9e05471.jpg"
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
    _scrollController.dispose(); // Dispose of the ScrollController
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
                      _buildHeaderButton(context, "How to take care?", const TakeCareScreen()),
                      _buildHeaderButton(context, "How to cook?", const CookScreen()),
                      _buildHeaderButton(context, "Traditional Knowledge", const KnowledgeScreen()),
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
                          imageUrl: notifyImages[index],
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
                                  backgroundImage: NetworkImage(plants[index]["image"]!),
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
                    imageUrl: "https://i.pinimg.com/564x/0c/e2/ca/0ce2ca51f4753fe6299527fdf332432f.jpg",
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
                    imageUrl: "https://i.pinimg.com/736x/4e/43/d9/4e43d9243931eca3766085fe58d4db9f.jpg",
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
                            imageUrl: "https://i.pinimg.com/736x/5e/5c/cc/5e5ccc2c8a45413243136ca20487755f.jpg",
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
                            imageUrl: "https://gigaplus.makeshop.jp/flowerbasket/logo/202209_logo_FOYER02.jpg",
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
                // const SizedBox(height: 16),
                // ElevatedButton(
                //   onPressed: () {
                //     showDialog(
                //       context: context,
                //       builder: (BuildContext context) {
                //         return AlertDialog(
                //           title: const Text('Contact Us'),
                //           content: const Text('Mail us at hello@plants.com'),
                //           actions: <Widget>[
                //             TextButton(
                //               child: const Text('Close'),
                //               onPressed: () => Navigator.of(context).pop(),
                //             ),
                //           ],
                //         );
                //       },
                //     );
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.green,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(8.0),
                //     ),
                //   ),
                //   child: const Text(
                //     "Contact With Us",
                //     style: TextStyle(color: Colors.white),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderButton(BuildContext context, String text, Widget screen) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildStyledContainer({required String imageUrl, required String title}) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 230,
            ),
          ),
          if (title.isNotEmpty)
            Positioned(
              bottom: 8,
              left: 8,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black54,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
