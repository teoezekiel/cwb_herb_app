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
import '../pages/take_care_screen.dart';
import '../pages/knowledge_screen.dart';
import '../pages/inbox_screen.dart';
import '../pages/profile_screen.dart';
import '../pages/body.dart';


class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final screens = [
    const HomeScreen(),
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
        title: Text('Home'),
        actions: [
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
          return connected ? screens[index] : const BuildNoInternet(); // Use screens[index] to display the selected screen
        },
        child: const Center(
          child: CircularProgressIndicator(
            color: ColorsManager.mainBlue,
          ),
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade100,
          labelTextStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: const Color(0xFFf1f5fb),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: index,
          animationDuration: const Duration(seconds: 1),
          onDestinationSelected: (index) => setState(() => this.index = index),
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

  SafeArea _homePage(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200.h,
                width: 200.w,
                child: FirebaseAuth.instance.currentUser!.photoURL != null
                    ? CachedNetworkImage(
                        imageUrl: FirebaseAuth.instance.currentUser!.photoURL!,
                        placeholder: (context, url) =>
                            Image.asset('assets/images/loading.gif'),
                        fit: BoxFit.cover,
                      )
                    : Image.asset('assets/images/placeholder.png'),
              ),
              Text(
                FirebaseAuth.instance.currentUser!.displayName!,
                style: TextStyles.font15DarkBlue500Weight
                    .copyWith(fontSize: 30.sp),
              ),
              BlocConsumer<AuthCubit, AuthState>(
                buildWhen: (previous, current) => previous != current,
                listenWhen: (previous, current) => previous != current,
                listener: (context, state) async {
                  if (state is AuthLoading) {
                    ProgressIndicaror.showProgressIndicator(context);
                  } else if (state is UserSignedOut) {
                    context.pop();
                    context.pushNamedAndRemoveUntil(
                      Routes.loginScreen,
                      predicate: (route) => false,
                    );
                  } else if (state is AuthError) {
                    await AwesomeDialog(
                      context: context,
                      dialogType: DialogType.info,
                      animType: AnimType.rightSlide,
                      title: 'Sign out error',
                      desc: state.message,
                    ).show();
                  }
                },
                builder: (context, state) {
                  return AppTextButton(
                    buttonText: 'Sign Out',
                    textStyle: TextStyles.font15DarkBlue500Weight,
                    onPressed: () {
                      _signOut(context);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signOut(BuildContext context) async {
    try {
      GoogleSignIn().disconnect();
    } finally {
      context.read<AuthCubit>().signOut();
    }
  }
}
