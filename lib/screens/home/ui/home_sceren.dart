import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dart:async';
import '/helpers/extensions.dart';
import '/routing/app_router.dart';
import '/routing/routes.dart';
import '../../../theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/no_internet.dart';
import '../../../core/widgets/progress_indicaror.dart';
import '../../../logic/cubit/auth_cubit.dart';
import '../../../theming/colors.dart';

// Import other necessary screens
import '../pages/take_care_screen.dart';
import '../pages/cook_screen.dart';
import '../pages/knowledge_screen.dart';
import '../pages/plant_detail_screen.dart';
import '../pages/cart_screen.dart';
import '../pages/culture_of_flower_screen.dart';
import '../pages/favorite_screen.dart';
import '../pages/inbox_screen.dart';
import '../pages/profile_screen.dart';

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
  final ScrollController _scrollController = ScrollController();
  
  int index = 0;  // Index for bottom navigation
  final List<Widget> screens = [
    const HomeScreen(),
    const TakeCareScreen(),
    const KnowledgeScreen(),
    const InboxScreen(),
    const ProfileScreen(),
  ];

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Screen'),
    TakeCareScreen(),
    KnowledgeScreen(),
    InboxScreen(),
    ProfileScreen(),
  ];

  static const List<Map<String, String>> plants = [
    {"name": "Noni", "image": "https://i.pinimg.com/564x/4f/08/69/4f08697eb6f7a3c26f29ef4884b67e12.jpg"},
    {"name": "Bonsai", "image": "https://i.pinimg.com/564x/b7/89/c6/b789c68039630efa414736d5702d0205.jpg"},
    {"name": "Moringa", "image": "https://i.pinimg.com/564x/6e/01/d0/6e01d0deb0218887b97ec6dbda4b54dc.jpg"},
    {"name": "Mint", "image": "https://i.pinimg.com/564x/16/05/c5/1605c5c53413da6cd647aee8d8f73e2d.jpg"},
    {"name": "Celery", "image": "https://i.pinimg.com/564x/84/63/a8/8463a80cedd33b2b47f14669a61ef1f2.jpg"}
  ];

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

    // Initializing the AuthCubit outside of the build process
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<AuthCubit>(context);
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlantDetailScreen(plantName: name, plantImage: image),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Navigator.pushNamed(context, Routes.cartScreen);
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(context, Routes.favoriteScreen);
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _signOut(context);
            },
          ),
        ],
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          return connected
              ? Scrollbar(
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
                                    Navigator.pushNamed(context, Routes.inboxScreen);
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
                            height: 100,
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
                                        CircleAvatar(
                                          radius: 40,
                                          backgroundImage: CachedNetworkImageProvider(plants[index]["image"]!),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          plants[index]["name"]!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : const BuildNoInternet();
        },
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Take Care',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Knowledge',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderButton(BuildContext context, String title, String routeName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          backgroundColor: ColorsManager.lightShadeOfGray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Text(title),
      ),
    );
  }

  Widget _buildStyledContainer({required String imageUrl, required String title}) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: CachedNetworkImageProvider(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.6), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _signOut(BuildContext context) async {
    final authCubit = context.read<AuthCubit>();

    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      authCubit.signOut(); // Ensure that this updates the UI
      Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false);
    } catch (error) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        headerAnimationLoop: false,
        animType: AnimType.topSlide,
        title: 'Error',
        desc: 'Failed to sign out. Please try again later.',
        btnOkOnPress: () {},
      ).show();
    }
  }
}
