import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_feed_task/core/constants/asset_path.dart';
import 'package:social_feed_task/core/constants/colors_palette.dart';
import 'package:social_feed_task/core/global_components/text_fields/k_text_field.dart';
import 'package:social_feed_task/core/global_components/text_styles/app_fons.dart';
import 'package:social_feed_task/features/social_feed/presentation/screens/create_post/create_post_screen.dart';
import 'package:social_feed_task/services/navigation_service/navigator.dart';

class PostSectionWidget extends StatelessWidget {
  final void Function()? onPressed;
  const PostSectionWidget({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.grey,
                child: Image.asset(AssetPath.nameIcon),
              ),
              const SizedBox(width: 10),
              // const Expanded(
              //   child: KTextField(
              //     textEditingEnabled: true,
              //     hintText: 'What\'s happening?',
              //     height: 40,
              //     backgroundColor: AppColors.white54,
              //     borderColor: AppColors.white,
              //   ),
              // ),
              InkWell(
                onTap: onPressed,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.white54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text('What\'s happening?',
                        style: AppFonts.bodyMedium.copyWith(
                            color: AppColors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(AssetPath.videoIcon,
                        width: 20, fit: BoxFit.contain),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text('Live',
                          style: AppFonts.bodyMedium.copyWith(
                              color: AppColors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    Image.asset(AssetPath.imageIcon,
                        width: 20, fit: BoxFit.contain),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text('Photo',
                          style: AppFonts.bodyMedium.copyWith(
                              color: AppColors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    Image.asset(AssetPath.nameIcon,
                        width: 20, fit: BoxFit.contain),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text('Feeling',
                          style: AppFonts.bodyMedium.copyWith(
                              color: AppColors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
                const SizedBox(width: 30),
                Container(
                  padding: const EdgeInsets.only(
                      bottom: 5, left: 14, right: 14),
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                      child: Text('Post',
                          style: AppFonts.bodyMedium.copyWith(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}