import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_feed_task/features/authentication/presentation/viewmodels/auth_viewmodel.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider.notifier);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Email',
            ),
            controller: emailController,
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
            controller: passwordController,
          ),
          ElevatedButton(
            onPressed: () {
              authState.login(emailController.toString(), passwordController.toString());
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}