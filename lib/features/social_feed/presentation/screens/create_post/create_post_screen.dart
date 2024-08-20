import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_feed_task/core/constants/colors_palette.dart';
import 'package:social_feed_task/core/global_components/buttons/k_button.dart';
import 'package:social_feed_task/core/global_components/text_fields/k_text_field.dart';
import 'package:social_feed_task/core/global_components/text_styles/app_fons.dart';
import 'package:social_feed_task/features/social_feed/presentation/widgets/profile_search_message_widget.dart';

class CreatePostScreen extends ConsumerStatefulWidget {
  const CreatePostScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreatePostScreenState();
}

class _CreatePostScreenState extends ConsumerState<CreatePostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileSearchMessageWidget(
                myProfilePicture: 'assets/images/logos/profile_pic_demo_1.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back,
                            color: AppColors.black54, size: 30),
                      ),
                      const SizedBox(width: 10),
                      const Text('Create a Post',
                          style: TextStyle(
                              color: AppColors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Visible for",
                          style: AppFonts.bodyMedium.copyWith(
                              color: AppColors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.grey100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Text('Friends',
                              style: TextStyle(
                                  color: AppColors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Divider(
              color: AppColors.black54,
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset(
                        'assets/images/logos/profile_pic_demo_1.png',
                        fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 250,
                      decoration: BoxDecoration(
                        color: AppColors.whiteLilac.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("What's happening?",
                            style: AppFonts.bodyMedium.copyWith(
                                color: AppColors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.normal)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Live Video",
                      style: AppFonts.bodyMedium.copyWith(
                          color: AppColors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 10),
                  Text("Photo/Video",
                      style: AppFonts.bodyMedium.copyWith(
                          color: AppColors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 10),
                  Text("Feeling",
                      style: AppFonts.bodyMedium.copyWith(
                          color: AppColors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: KButton(
                text: 'Post',
                onPressed: (){},
                width: double.infinity,
                height: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
