import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_feed_task/core/constants/colors_palette.dart';
import 'package:social_feed_task/features/authentication/presentation/screens/login_screen.dart';
import 'package:social_feed_task/services/di/service_locator_di.dart';
import 'package:social_feed_task/services/navigation_service/navigator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Feed Task',
      navigatorKey: NavigationService.navigatorKey,
      theme: ThemeData(
        primaryColor: AppColors.white,
        useMaterial3: false,
      ),
      home: const LoginScreen()
    );
  }
}
