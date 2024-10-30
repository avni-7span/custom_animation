import 'package:auto_route/auto_route.dart';
import 'package:custom_animations/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToBottomBar();
  }

  Future<void> navigateToBottomBar() async {
    await Future.delayed(const Duration(seconds: 4));
    if (mounted) {
      context.replaceRoute(const BottomNavigationBarRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/lottie/car_animation.json',
        ),
      ),
    );
  }
}
