import 'package:flutter/material.dart';
import 'package:social_feed_task/core/constants/asset_path.dart';
import 'package:social_feed_task/core/constants/colors_palette.dart';
import 'package:social_feed_task/core/global_components/text_styles/app_fons.dart';
import 'package:social_feed_task/features/social_feed/presentation/components/post_image_grid.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: AppColors.grey,
                      child: Image.asset(AssetPath.nameIcon),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('John Doe',
                              style: AppFonts.bodyMedium.copyWith(
                                  color: AppColors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700)),
                          Text('15 hour. Public',
                              style: AppFonts.bodyMedium.copyWith(
                                  color: AppColors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  ],
                ),
                Image.asset(AssetPath.optionsIcon,
                    width: 20, fit: BoxFit.contain),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const PostImageGrid(imagePaths: [
            'assets/images/logos/demo_image.png',
            'assets/images/logos/demo_image_2.png',
            'assets/images/logos/demo_image_3.png',
            'assets/images/logos/demo_image_4.png',
            'assets/images/logos/demo_image_5.png',
          ]),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: AppColors.grey,
                      child: Image.asset(AssetPath.nameIcon),
                    ),
                    
                    Positioned(
                      left:
                          20, 
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: AppColors.grey,
                        child: Image.asset(AssetPath.nameIcon),
                      ),
                    ),
                    
                    Positioned(
                      left:
                          40,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: AppColors.grey,
                        child: Image.asset(AssetPath.nameIcon),
                      ),
                    ),
                    Positioned(
                      left:
                        60,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: AppColors.grey,
                        child: const Text(
                          '+99',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('3 Comments', style: AppFonts.bodyMedium.copyWith(
                      color: AppColors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                    )),
                    const SizedBox(width: 20),
                    Text('5 Shares', style: AppFonts.bodyMedium.copyWith(
                      color: AppColors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                    )),
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: AppColors.grey,
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(AssetPath.likeIcon, color: AppColors.black54, width: 22, fit: BoxFit.contain),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text('Like', style: AppFonts.bodyMedium.copyWith(
                        color: AppColors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.w800
                      )),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(AssetPath.commentIcon, width: 20, color: AppColors.black54, fit: BoxFit.contain),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text('Comments', style: AppFonts.bodyMedium.copyWith(
                        color: AppColors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.w800
                      )),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(AssetPath.shareIcon, color: AppColors.black54, width: 20, fit: BoxFit.contain),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text('Share', style: AppFonts.bodyMedium.copyWith(
                        color: AppColors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.w800
                      )),
                    ),
                  ],
                ),
              ],
            ),
          ), 
          Divider(
            color: AppColors.grey,
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.grey,
                  child: Image.asset(AssetPath.nameIcon),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColorForButtonBackground,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Write a comment...',
                              hintStyle: AppFonts.bodyMedium.copyWith(
                                color: AppColors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Image.asset(AssetPath.gifIcon, width: 20, fit: BoxFit.contain),
                        const SizedBox(width: 10),
                        Image.asset(AssetPath.imageIcon, width: 20, fit: BoxFit.contain),
                        const SizedBox(width: 10),
                        Image.asset(AssetPath.nameIcon, width: 20, fit: BoxFit.contain),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.lightBlue,
                    borderRadius: BorderRadius.circular(5),
                    
                  ),
                  child: Image.asset(AssetPath.sendIcon, width: 20, color: AppColors.blue, fit: BoxFit.contain)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
