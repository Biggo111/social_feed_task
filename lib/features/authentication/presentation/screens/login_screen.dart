import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_feed_task/core/constants/asset_path.dart';
import 'package:social_feed_task/core/constants/colors_palette.dart';
import 'package:social_feed_task/core/global_components/buttons/k_button.dart';
import 'package:social_feed_task/core/global_components/buttons/k_drop_down_button.dart';
import 'package:social_feed_task/core/global_components/text_fields/k_text_field.dart';
import 'package:social_feed_task/core/global_components/text_styles/app_fons.dart';
import 'package:social_feed_task/features/authentication/presentation/viewmodels/auth_viewmodel.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String selectedValue = 'English';

  @override
  Widget build(BuildContext context) {
   final authState = ref.watch(authControllerProvider);
   final authController = ref.read(authControllerProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(AssetPath.meetmaxLogo,
                          width: 16, fit: BoxFit.contain),
                      const SizedBox(width: 5),
                      const Text("MeetMax", style: AppFonts.bodyRegular12),
                    ],
                  ),
                  KDropdownButton(
                      value: selectedValue,
                      items: const [
                        DropdownMenuItem(
                            value: 'English', child: Text('Option 1', style: AppFonts.bodyRegular)),
                        DropdownMenuItem(
                            value: 'Bangla', child: Text('Option 2', style: AppFonts.bodyRegular)),
                        DropdownMenuItem(
                            value: 'German', child: Text('Option 3', style: AppFonts.bodyRegular)),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value!;
                        });
                      },
                      width: 200.0,
                      height: 25.0,
                      backgroundColor: Colors.white,
                      textStyle: AppFonts.bodyRegular,
                      borderColor: AppColors.white,
                      hint: selectedValue,
                  )
                ],
              ),
              const Text("Sign In", style: AppFonts.heading3Bold),
              const SizedBox(height: 10),
              const Text("Welcome back, you've been missed!", style: AppFonts.bodyRegular),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        KButton(
                          text: 'Log in with Google', 
                          onPressed: (){},
                          width: 300,
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          icon: Image.asset(AssetPath.googleIcon, width: 16, fit: BoxFit.contain),
                          textStyle: AppFonts.bodyRegular.copyWith(color: AppColors.black, fontSize: 12, fontWeight: FontWeight.w500),
                          backgroundColor: AppColors.white54,
                        ),
                        KButton(
                          text: 'Log in with Apple', 
                          onPressed: (){},
                          width: 300,
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          icon: Image.asset(AssetPath.appleIcon, width: 16, fit: BoxFit.contain),
                          textStyle: AppFonts.bodyRegular.copyWith(color: AppColors.black, fontSize: 12, fontWeight: FontWeight.w500),
                          backgroundColor: AppColors.white54,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.grey,
                            thickness: 0.5,
                            indent: 12,
                            endIndent: 5,
                          ),
                        ),
                        const Text("OR", style: AppFonts.bodyBold),
                        Expanded(
                          child: Divider(
                            color: AppColors.grey,
                            thickness: 0.5,
                            indent: 5,
                            endIndent: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    KTextField(
                      width: 650,
                      height: 40,
                      hintText: 'Your Email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textStyle: AppFonts.bodyBold,
                      icon: Image.asset(AssetPath.mailIcon, width: 16, fit: BoxFit.contain),
                    ),
                    const SizedBox(height: 20),
                    KTextField(
                      width: 650,
                      height: 40,
                      hintText: 'Your Password',
                      controller: passwordController,
                      keyboardType: TextInputType.emailAddress,
                      textStyle: AppFonts.bodyBold,
                      icon: Image.asset(AssetPath.lockIcon, width: 16, fit: BoxFit.contain),
                      showPassword: true,
                      obscureText: authState.passwordVisible,
                      onTogglePasswordVisibility: authController.togglePasswordVisibility,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
