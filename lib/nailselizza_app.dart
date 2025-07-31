import 'package:flutter/material.dart';
import 'package:app/features/auth/auth.dart';
import 'package:app/features/main/main.dart';
import 'package:app/features/record/record.dart';
import 'package:app/features/splash/splash.dart';
import 'package:app/features/reviews/reviews.dart';
import 'package:app/features/config/theme/theme.dart';
import 'package:app/features/examples_of_works/examples_of_works.dart';

class NailselizzaApp extends StatelessWidget {
  const NailselizzaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialRoute: '/',
      routes: {
      '/' : (context) => const SplashScreen(),
      '/register' : (context) => const SignUpScreen(),
      '/login' : (context) => const SignInScreen(),
      '/home' : (context) => const MainScreen(),
      '/works' : (context) => const ExampleOfWorksScreen(),
      '/reviews' : (context) => const ReviewsScreen(),
      '/services' : (context) => const ServicesScreen(),
      '/calendar' : (context) => CalendarScreen(),      
      },
    );
  }
}