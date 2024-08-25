import 'package:flutter/material.dart';
import 'cart_screen.dart';

class PlantInfoScreen extends StatefulWidget {
  final String plantName;
  final String plantImage;

  const PlantInfoScreen({
    Key? key,
    required this.plantName,
    required this.plantImage,
  }) : super(key: key);

  @override
  _PlantInfoScreenState createState() => _PlantInfoScreenState();
}

class _PlantInfoScreenState extends State<PlantInfoScreen> {
  bool _isFavorite = false; // Tracks whether the plant is favorited

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Color(0xff9aae9d),
            child: Column(
              children: [
                AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text(
                    widget.plantName,
                    style: TextStyle(color: Colors.black),
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      icon: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: _isFavorite ? Colors.red : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite; // Toggle favorite state
                        });
                        // Optionally, add code to manage the global favorites list
                        // or persist the favorite status in a database
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.shopping_cart ,color:Colors.black,),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CartScreen()),
                        );
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Center(
                    child: Image.asset(
                      widget.plantImage,
                      height: 210,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Color(0xffacd4b2),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.plantName,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            '\$30',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      const Text(
                        'Lorem ipsum dolor sit amet consectetur. Porta blandit aliquam lacus dignissim commodo malesuada sed. Neque nisi quis velit laoreet malesuada aliquet a. Mi maecenas massa aliquam nulla suscipit vel tellus ut dis. Nisl quis vitae nibh neque ac vulputate arcu id eu. Neque nisi quis velit laoreet malesuada aliquet a. Mi maecenas massa aliquam nulla suscipit vel tellus ut dis. Nisl quis vitae nibh neque ac vulputate arcu id eu. Neque nisi quis velit laoreet malesuada aliquet a. Mi maecenas massa aliquam nulla suscipit vel tellus ut dis. Nisl quis vitae nibh neque ac vulputate arcu id eu.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildDetailCard(
                              Icons.thermostat, 'Temperature', '27°'),
                          _buildDetailCard(Icons.straighten, 'Size', 'S'),
                          _buildDetailCard(Icons.opacity, 'Humidity', '10'),
                          _buildDetailCard(Icons.water_drop, 'Water', '2 times'),
                        ],
                      ),
                      SizedBox(height: 36),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Center(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  // Handle add to cart action
                                },
                                icon: Icon(Icons.add_shopping_cart),
                                label: Text('Add to Cart'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32, vertical: 12),
                                  textStyle: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailCard(IconData icon, String value, String label) {
    return Container(
      width: 65,
      height: 110,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, size: 26),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(fontSize: 11),
          ),
          SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
