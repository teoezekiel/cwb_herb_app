// culture_of_flower_screen.dart
import 'package:flutter/material.dart';

class CultureOfFlowerScreen extends StatelessWidget {
  const CultureOfFlowerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('test'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Culture of Flower',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildStyledContainer(
                imageUrl: "https://i.pinimg.com/564x/0c/e2/ca/0ce2ca51f4753fe6299527fdf332432f.jpg",
                title: "Beautiful Flowers",
              ),
              const SizedBox(height: 16),
              const Text(
                'Flowers have been an integral part of human culture since ancient times. They symbolize beauty, love, and tranquility. Different cultures have unique practices and beliefs surrounding flowers.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),
              _buildStyledContainer(
                imageUrl: "https://i.pinimg.com/736x/4e/43/d9/4e43d9243931eca3766085fe58d4db9f.jpg",
                title: "Flower Festivals",
              ),
              const SizedBox(height: 16),
              const Text(
                'Many cultures celebrate flower festivals to honor the beauty of nature and the changing seasons. These festivals often include parades, flower displays, and cultural performances.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),
              _buildStyledContainer(
                imageUrl: "https://i.pinimg.com/736x/5e/5c/cc/5e5ccc2c8a45413243136ca20487755f.jpg",
                title: "Flower Arrangements",
              ),
              const SizedBox(height: 16),
              const Text(
                'The art of flower arranging, known as ikebana in Japan, is a traditional practice that emphasizes harmony, balance, and beauty. Each arrangement is a reflection of the arranger\'s creativity and connection to nature.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  "Back to Home",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStyledContainer({required String imageUrl, required String title}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class CartScreen extends StatefulWidget {
//   @override
//   _CartScreenState createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {
//   final List<Map<String, dynamic>> _cartItems = [
//     {
//       'name': 'Grand Rapids',
//       'image': 'assets/images/Grand_Rapids.jpg', // Local asset image path
//       'quantity': 1,
//       'price': 20,
//       'description': 'Additional Explain for that plant',
//     },
//     {
//       'name': 'Grand Rapids',
//       'image': 'assets/images/Grand_Rapids.jpg', // Local asset image path
//       'quantity': 1,
//       'price': 40,
//       'description': 'Additional Explain for that plant',
//     },
//     {
//       'name': 'Grand Rapids',
//       'image': 'assets/images/Grand_Rapids.jpg', // Local asset image path
//       'quantity': 1,
//       'price': 40,
//       'description': 'Additional Explain for that plant',
//     },
//   ];
//
//   int get _subTotal => _cartItems.fold(
//       0, (sum, item) => sum + (item['quantity'] as int) * (item['price'] as int));
//   int get _deliveryFee => 20;
//   int get _total => _subTotal + _deliveryFee;
//
//   void _incrementQuantity(int index) {
//     setState(() {
//       _cartItems[index]['quantity']++;
//     });
//   }
//
//   void _decrementQuantity(int index) {
//     setState(() {
//       if (_cartItems[index]['quantity'] > 1) {
//         _cartItems[index]['quantity']--;
//       }
//     });
//   }
//
//   void _removeItem(int index) {
//     setState(() {
//       _cartItems.removeAt(index);
//     });
//     return Scaffold(
//       backgroundColor: const Color(0xFFB9F6CA),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: const Text('Cart', style: TextStyle(color: Colors.black)),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _cartItems.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     margin: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         children: [
//                           Image.asset(
//                             _cartItems[index]['image'],
//                             width: 80,
//                             height: 80,
//                           ),
//                           const SizedBox(width: 16),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   _cartItems[index]['name'],
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(_cartItems[index]['description']),
//                                 const SizedBox(height: 4),
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(Icons.remove),
//                                       onPressed: () =>
//                                           _decrementQuantity(index),
//                                     ),
//                                     Text('${_cartItems[index]['quantity']}'),
//                                     IconButton(
//                                       icon: const Icon(Icons.add),
//                                       onPressed: () => _incrementQuantity(index),
//                                     ),
//                                   ],
//                                 ),
//                                 Text(
//                                     '\$${_cartItems[index]['price'] * _cartItems[index]['quantity']}'),
//                               ],
//                             ),
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.delete),
//                             onPressed: () => _removeItem(index),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Sub total:',
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 Text(
//                   '\$$_subTotal',
//                   style: const TextStyle(fontSize: 16),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Delivery:',
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 Text(
//                   '\$$_deliveryFee',
//                   style: const TextStyle(fontSize: 16),
//                 ),
//               ],
//             ),
//             const Divider(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Total:',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   '\$$_total',
//                   style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle checkout action
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//               child: const Text(
//                 'Check Out',
//                 style: TextStyle(fontSize: 16, color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }  }
//
//   @override
//   Widget build(BuildContext context) {
//


// take care screen
//
// import 'package:flutter/material.dart';
//
// class TakeCareScreen extends StatelessWidget {
//   const TakeCareScreen({super.key});
//
//   final List<Map<String, String>> plants = const [
//     {'name': 'Plant 1', 'image': 'assets/images/plant1.jpg'},
//     {'name': 'Plant 2', 'image': 'assets/images/plant2.jpg'},
//     {'name': 'Plant 3', 'image': 'assets/images/plant3.jpg'},
//     {'name': 'Plant 4', 'image': 'assets/images/plant4.jpg'},
//     {'name': 'Plant 5', 'image': 'assets/images/plant5.jpg'},
//     {'name': 'Plant 6', 'image': 'assets/images/plant6.jpg'},
//     {'name': 'Plant 7', 'image': 'assets/images/plant7.jpg'},
//     {'name': 'Plant 8', 'image': 'assets/images/plant8.jpg'},
//     // Add more plants as needed
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFB9F6CA),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF00C853),
//         title: const Text("How to Take Care?"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Plant Guide',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Wrap(
//                 spacing: 8, // horizontal spacing between items
//                 runSpacing: 12, // vertical spacing between rows
//                 children: List.generate(plants.length, (index) {
//                   return Column(
//                     children: [
//                       ClipOval(
//                         child: Image.asset(
//                           plants[index]['image']!,
//                           width: 60,
//                           height: 60,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Container(
//                         width: 60, // Fixed width to align text
//                         child: Text(
//                           plants[index]['name']!,
//                           style: const TextStyle(fontSize: 13),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ],
//                   );
//                 }),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// const InboxScreen({Key? key}) : super(key: key);




