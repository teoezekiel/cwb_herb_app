import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '/helpers/extensions.dart';
import '/routing/routes.dart';
import '/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/no_internet.dart';
import '../../../core/widgets/progress_indicaror.dart';
import '../../../logic/cubit/auth_cubit.dart';
import '../../../theming/colors.dart';

// Import other necessary screens
import '../pages/body_screen.dart';
import '../pages/take_care_screen.dart';
import '../pages/knowledge_screen.dart';
import '../pages/inbox_screen.dart';
import '../pages/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  bool isLoading = false;  // Variable to track loading state
  final screens = [
    const BodyScreen(),
    const TakeCareScreen(),
    const KnowledgeScreen(),
    const InboxScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _signOut(context);  // Call sign-out function when clicked
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          OfflineBuilder(
            connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
            ) {
              final bool connected = connectivity != ConnectivityResult.none;
              return connected ? screens[index] : const BuildNoInternet();
            },
            child: const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainBlue,
              ),
            ),
          ),
          if (isLoading)
            Center(
              child: Image.asset(
                'assets/images/loading.gif',  // Display loading.gif when isLoading is true
                width: 100,
                height: 100,
              ),
            ),
        ],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade100,
          labelTextStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: const Color(0xFFf1f5fb),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: index,
          animationDuration: const Duration(seconds: 1),
          onDestinationSelected: (index) => setState(() {
            this.index = index;
            isLoading = true;  // Set loading to true when navigating
            Future.delayed(const Duration(seconds: 3), () { // Simulate loading duration
              setState(() {
                isLoading = false;
              });
            });
          }),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.eco),
              label: 'Guide',
            ),
            NavigationDestination(
              icon: Icon(Icons.laptop_chromebook_rounded),
              label: 'Knowledge',
            ),
            NavigationDestination(
              icon: Icon(Icons.email_outlined),
              label: 'Inbox',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  void _signOut(BuildContext context) {
    setState(() {
      isLoading = true;  // Show loading indicator during sign-out
    });

    context.read<AuthCubit>().signOut().then((_) {
      setState(() {
        isLoading = false;  // Hide loading indicator after sign-out
      });
      Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.loginScreen,
        (Route<dynamic> route) => false,
      );
    }).catchError((error) {
      setState(() {
        isLoading = false;  // Hide loading indicator on error
      });
      print('Sign out failed: ${error.toString()}');  // Debugging log
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: 'Sign out error',
        desc: 'Failed to sign out: ${error.toString()}',
      ).show();
    });
  }
}
