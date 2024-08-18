import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_feed_task/core/constants/asset_path.dart';
import 'package:social_feed_task/core/constants/colors_palette.dart';
import 'package:social_feed_task/core/global_components/buttons/k_button.dart';
import 'package:social_feed_task/core/global_components/text_fields/k_text_field.dart';
import 'package:social_feed_task/core/global_components/text_styles/app_fons.dart';
import 'package:social_feed_task/features/authentication/presentation/components/language_dropdown_button.dart';
import 'package:social_feed_task/features/authentication/presentation/screens/forgot_password_screen.dart';
import 'package:social_feed_task/features/authentication/presentation/screens/signup_screen.dart';
import 'package:social_feed_task/features/authentication/presentation/viewmodels/auth_viewmodel.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String selectedValue = 'English';

  @override
  Widget build(BuildContext context) {
   final authState = ref.watch(authControllerProvider);
   final authController = ref.read(authControllerProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(AssetPath.meetmaxLogo,
                             fit: BoxFit.contain),
                        const SizedBox(width: 5),
                        Text("MeetMax", style: AppFonts.bodyRegular12.copyWith(color: AppColors.black, fontWeight: FontWeight.w800, fontSize: 16)),
                      ],
                    ),
                    const LanguageDropdownButton()
                  ],
                ),
                const SizedBox(height: 50),
                Text("Sign In", style: AppFonts.heading3Bold),
                const SizedBox(height: 10),
                Text("Welcome back, you've been missed!", style: AppFonts.bodyBold.copyWith(color: AppColors.black54, fontSize: 16)),
                const SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grey.withOpacity(0.1),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
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
                            textStyle: AppFonts.bodyBold.copyWith(color: AppColors.black54, fontSize: 12, fontWeight: FontWeight.bold),
                            backgroundColor: AppColors.white70,
                          ),
                          KButton(
                            text: 'Log in with Apple', 
                            onPressed: (){},
                            width: 300,
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            icon: Image.asset(AssetPath.appleIcon, width: 16, fit: BoxFit.contain),
                            textStyle: AppFonts.bodyBold.copyWith(color: AppColors.black54, fontSize: 12, fontWeight: FontWeight.bold),
                            backgroundColor: AppColors.white70,
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
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
                          Text("OR", style: AppFonts.bodyBold),
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
                      const SizedBox(height: 15),
                      KTextField(
                        width: 650,
                        height: 40,
                        hintText: 'Your Email',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        borderColor: AppColors.black26,
                        textStyle: AppFonts.bodyBold,
                        icon: Image.asset(AssetPath.mailIcon, width: 16, fit: BoxFit.contain),
                      ),
                      const SizedBox(height: 20),
                      KTextField(
                        width: 650,
                        height: 40,
                        hintText: 'Your Password',
                        controller: _passwordController,
                        keyboardType: TextInputType.emailAddress,
                        textStyle: AppFonts.bodyBold,
                        borderColor: AppColors.black26,
                        icon: Image.asset(AssetPath.lockIcon, width: 16, fit: BoxFit.contain),
                        showPassword: true,
                        obscureText: authState.passwordVisible,
                        onTogglePasswordVisibility: authController.togglePasswordVisibility,
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    authController.toggleRememberMe();
                                  },
                                  child: Icon(
                                    authState.toggleRememberMe ? Icons.check_box_outline_blank : Icons.check_box,
                                    color: AppColors.black54,
                                    size: 16,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 2),
                                  child: Text("Remember me", style: AppFonts.bodyMedium.copyWith(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.black54)),
                                ),
                              ],
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, CupertinoPageRoute(builder: (context) => const ForgotPasswordScreen()));
                              },
                              child: Text("Forgot Password?", style: AppFonts.bodyMedium.copyWith(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.black54))),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      KButton(
                        text: 'Log In',
                        onPressed: (){
                          authController.login(_emailController.text.trim(), _passwordController.text.trim());
                        },
                        height: 40,
                        backgroundColor: AppColors.blue,
                        textStyle: AppFonts.bodyRegular.copyWith(color: AppColors.white, fontSize: 16),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("You haven't any account?", style: AppFonts.bodyMedium),
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => const SignUpScreen()));
                            },
                            child: Text("Sign Up", style: AppFonts.bodyMedium.copyWith(color: AppColors.blue, fontWeight: FontWeight.w800)),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
