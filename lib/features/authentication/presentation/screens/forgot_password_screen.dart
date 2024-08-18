import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_feed_task/core/constants/asset_path.dart';
import 'package:social_feed_task/core/constants/colors_palette.dart';
import 'package:social_feed_task/core/global_components/buttons/k_button.dart';
import 'package:social_feed_task/core/global_components/text_fields/k_text_field.dart';
import 'package:social_feed_task/core/global_components/text_styles/app_fons.dart';
import 'package:social_feed_task/features/authentication/presentation/components/language_dropdown_button.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
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
                Text("Forgot Password?", style: AppFonts.heading3Bold),
                const SizedBox(height: 10),
                Text(
                    "Enter your details to receive a rest link",
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
                      KTextField(
                        width: 650,
                        height: 40,
                        hintText: 'Your Email',
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        borderColor: AppColors.black26,
                        textStyle: AppFonts.bodyBold,
                        icon: Image.asset(AssetPath.mailIcon,
                            width: 16, fit: BoxFit.contain),
                      ),
                      const SizedBox(height: 20),
                      KButton(
                        text: 'Send',
                        onPressed: () {
                          
                        },
                        width: 650,
                        height: 40,
                        backgroundColor: AppColors.blue,
                        textStyle: AppFonts.bodyBold
                            .copyWith(color: AppColors.white, fontSize: 16),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Icon(Icons.arrow_back_ios, color: AppColors.blue, size: 16,),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Back to Sign In",
                                style: AppFonts.bodyMedium.copyWith(
                                    color: AppColors.blue,
                                    fontWeight: FontWeight.w800, fontSize: 16)),
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