import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_feed_task/core/constants/asset_path.dart';
import 'package:social_feed_task/features/authentication/presentation/screens/login_screen.dart';
import 'package:social_feed_task/features/social_feed/presentation/screens/feed_screen/feed_screen.dart';
import 'package:social_feed_task/services/di/service_locator_di.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _checkAuthenticationStatus();
    });
  }

  Future<void> _checkAuthenticationStatus() async{
    final prefs = sl<SharedPreferences>();
    final authToken = prefs.getString('auth_token');

    if(authToken != null && authToken.isNotEmpty){
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FeedScreen(),
            ));
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.fastLinearToSlowEaseIn,
                child: Image.asset(AssetPath.meetmaxLogoWithName, fit: BoxFit.contain, height: 150, width: 200,)),
            ],
          ),
        ],
      ),
    );
  }
}