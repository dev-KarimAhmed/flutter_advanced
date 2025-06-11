import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_application/core/di/dependency_injection.dart';
import 'package:flutter_complete_application/core/routing/routes.dart';
import 'package:flutter_complete_application/features/home/ui/views/home_screen.dart';
import 'package:flutter_complete_application/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_application/features/login/ui/login_screen.dart';
import 'package:flutter_complete_application/features/onboarding/ui/onboarding_screen.dart';
import 'package:flutter_complete_application/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:flutter_complete_application/features/sign_up/ui/signup_view.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: LoginScreen(),
              ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<SignupCubit>(),
                child: SignupView(),
              ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder:
              (_) => HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
