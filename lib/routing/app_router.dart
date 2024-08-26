import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/cubit/auth_cubit.dart';
import '../screens/create_password/ui/create_password.dart';
import '../screens/forget/ui/forget_screen.dart';
import '../screens/home/ui/home_sceren.dart';
import '../screens/login/ui/login_screen.dart';
import '../screens/signup/ui/sign_up_sceen.dart';
import 'routes.dart';

// Import your additional screens
import '../screens/home/pages/take_care_screen.dart';
import '../screens/home/pages/knowledge_screen.dart';
import '../screens/home/pages/inbox_screen.dart';
import '../screens/home/pages/profile_screen.dart';
import '../screens/home/pages/cook_screen.dart';
import '../screens/home/pages/plant_detail_screen.dart';
import '../screens/home/pages/cart_screen.dart';
import '../screens/home/pages/culture_of_flower_screen.dart';
import '../screens/home/pages/favorite_screen.dart';
import '../screens/home/pages/body.dart';

class AppRouter {
  late AuthCubit authCubit;

  AppRouter() {
    authCubit = AuthCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const LoginScreen(),
          ),
        );

      case Routes.forgetScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const ForgetScreen(),
          ),
        );

      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const SignUpScreen(),
          ),
        );

      case Routes.createPassword:
        final arguments = settings.arguments;
        if (arguments is List) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: authCubit,
              child: CreatePassword(
                googleUser: arguments[0],
                credential: arguments[1],
              ),
            ),
          );
        }
        break;

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const HomeScreen(),
          ),
        );

      // Additional routes for your other screens
      case Routes.takeCareScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const TakeCareScreen(),
          ),
        );

      case Routes.knowledgeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const KnowledgeScreen(),
          ),
        );

      case Routes.inboxScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const InboxScreen(),
          ),
        );

      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const ProfileScreen(),
          ),
        );

      case Routes.cookScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const CookScreen(),
          ),
        );

      case Routes.plantDetailScreen:
      final arguments = settings.arguments as Map<String, dynamic>?; // Expecting arguments to be a map
      if (arguments != null && arguments.containsKey('plantName') && arguments.containsKey('plantImage')) {
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: PlantDetailScreen(
              plantName: arguments['plantName'],
              plantImage: arguments['plantImage'],
            ),
          ),
        );
      }
      break;

      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: CartScreen(),
          ),
        );

      case Routes.cultureOfFlowerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const CultureOfFlowerScreen(),
          ),
        );

      case Routes.favoriteScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: FavoriteScreen(),
          ),
        );

      default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
    }
    return null;
  }
}
