import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_feed_task/core/constants/asset_path.dart';
import 'package:social_feed_task/core/constants/colors_palette.dart';
import 'package:social_feed_task/core/global_components/buttons/k_button.dart';
import 'package:social_feed_task/core/global_components/text_fields/k_text_field.dart';
import 'package:social_feed_task/core/global_components/text_styles/app_fons.dart';
import 'package:social_feed_task/features/authentication/presentation/components/language_dropdown_button.dart';
import 'package:social_feed_task/features/authentication/presentation/screens/login_screen.dart';
import 'package:social_feed_task/features/authentication/presentation/viewmodels/auth_viewmodel.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  String? _selectedGender;

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
                        Image.asset(AssetPath.meetmaxLogo, fit: BoxFit.contain),
                        const SizedBox(width: 5),
                        Text("MeetMax",
                            style: AppFonts.bodyRegular12.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 16)),
                      ],
                    ),
                    const LanguageDropdownButton()
                  ],
                ),
                const SizedBox(height: 40),
                Text("Getting Started", style: AppFonts.heading3Bold),
                const SizedBox(height: 10),
                Text(
                    "Create an account to continue and connect with the people",
                    textAlign: TextAlign.center,
                    style: AppFonts.bodyBold
                        .copyWith(color: AppColors.black54, fontSize: 16)),
                const SizedBox(height: 30),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                            onPressed: () {},
                            width: 300,
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            icon: Image.asset(AssetPath.googleIcon,
                                width: 16, fit: BoxFit.contain),
                            textStyle: AppFonts.bodyBold.copyWith(
                                color: AppColors.black54,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                            backgroundColor: AppColors.white70,
                          ),
                          KButton(
                            text: 'Log in with Apple',
                            onPressed: () {},
                            width: 300,
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            icon: Image.asset(AssetPath.appleIcon,
                                width: 16, fit: BoxFit.contain),
                            textStyle: AppFonts.bodyBold.copyWith(
                                color: AppColors.black54,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
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
                        icon: Image.asset(AssetPath.mailIcon,
                            width: 16, fit: BoxFit.contain),
                      ),
                      const SizedBox(height: 15),
                      KTextField(
                        width: 650,
                        height: 40,
                        hintText: 'Your Name',
                        controller: _nameController,
                        keyboardType: TextInputType.emailAddress,
                        borderColor: AppColors.black26,
                        textStyle: AppFonts.bodyBold,
                        icon: Image.asset(AssetPath.nameIcon,
                            width: 16, fit: BoxFit.contain),
                      ),
                      const SizedBox(height: 20),
                      KTextField(
                        width: 650,
                        height: 40,
                        hintText: 'Create Password',
                        controller: _passwordController,
                        keyboardType: TextInputType.emailAddress,
                        textStyle: AppFonts.bodyBold,
                        borderColor: AppColors.black26,
                        icon: Image.asset(AssetPath.lockIcon,
                            width: 16, fit: BoxFit.contain),
                        showPassword: true,
                        obscureText: authState.passwordVisible,
                        onTogglePasswordVisibility: authController.togglePasswordVisibility,
                      ),
                      const SizedBox(height: 15),
                      KTextField(
                        width: 650,
                        height: 40,
                        hintText: 'Date of Birth',
                        controller: _dobController,
                        keyboardType: TextInputType.emailAddress,
                        borderColor: AppColors.black26,
                        textStyle: AppFonts.bodyBold,
                        icon: Image.asset(AssetPath.calendarIcon,
                            width: 16, fit: BoxFit.contain),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            width: 650,
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Image.asset(_selectedGender=='Male' ? AssetPath.maleIcon : AssetPath.femaleIcon,
                                      width: 16, fit: BoxFit.contain),
                                  const SizedBox(width: 10),
                                  Row(
                                    children: [
                                      Radio<String>(
                                        value: 'Male',
                                        groupValue: _selectedGender,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedGender = value;
                                          });
                                        },
                                      ),
                                      const Text('Male'),
                                      const SizedBox(width: 10),
                                      Radio<String>(
                                        value: 'Female',
                                        groupValue: _selectedGender,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedGender = value;
                                          });
                                        },
                                      ),
                                      const Text('Female'),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 20),
                      KButton(
                        text: 'Sign Up',
                        onPressed: () {
                          // authController.login(emailController.text.trim(), passwordController.text.trim());
                        },
                        height: 40,
                        backgroundColor: AppColors.blue,
                        textStyle: AppFonts.bodyRegular
                            .copyWith(color: AppColors.white, fontSize: 16),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("You have an account?",
                              style: AppFonts.bodyMedium),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => const LoginScreen()));
                            },
                            child: Text("Log In",
                                style: AppFonts.bodyMedium.copyWith(
                                    color: AppColors.blue,
                                    fontWeight: FontWeight.w800)),
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
