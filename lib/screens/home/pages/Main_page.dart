// import 'package:flutter/material.dart';
// import 'package:medical_herb_app/screens/home_screen.dart';
// import 'package:medical_herb_app/screens/inbox_screen.dart';
// import 'package:medical_herb_app/screens/knowledge_screen.dart';
// import 'package:medical_herb_app/screens/profile_screen.dart';
//
// void main() {
//   runApp(MessengerApp());
// }
//
// class MessengerApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Messenger',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MainPage(),
//     );
//   }
// }
//
// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   int index = 0;
//   final screens = [
//     HomeScreen(),
//     KnowledgeScreen(),
//     InboxScreen(),
//     ProfileScreen(),
//   ];
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     body: screens[index],
//     bottomNavigationBar: NavigationBarTheme(
//       data: NavigationBarThemeData(
//         indicatorColor: Colors.blue.shade100,
//         labelTextStyle: WidgetStateProperty.all(
//           TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//         ),
//       ),
//       child: NavigationBar(
//         height: 60,
//         backgroundColor: Color(0xFFf1f5fb),
//         labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
//         selectedIndex: index,
//         animationDuration: Duration(seconds: 3),
//         onDestinationSelected: (index) =>
//             setState(() => this.index = index),
//         destinations: [
//           NavigationDestination(
//             icon: Icon(Icons.email_outlined),
//             label: 'Home',
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.chat_bubble_outline),
//             label: 'Knowledge',
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.group_outlined),
//             label: 'Inbox',
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.videocam_off_outlined, size: 30),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     ),
//   );
// }
