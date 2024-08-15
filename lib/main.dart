import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_feed_task/features/authentication/presentation/screens/login_screen.dart';
import 'package:social_feed_task/services/di/service_locator_di.dart';

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
      title: 'Social Feed Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen()
    );
  }
}
