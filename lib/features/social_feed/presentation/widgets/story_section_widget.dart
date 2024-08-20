import 'package:flutter/material.dart';
import 'package:social_feed_task/core/constants/colors_palette.dart';
import 'package:social_feed_task/core/global_components/text_styles/app_fons.dart';


class StorySectionWidget extends StatelessWidget {
  final String profilePicture;
  final String name;

  const StorySectionWidget({
    super.key,
    required this.profilePicture,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
            width: 60,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: AppColors.blue, width: 3),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(profilePicture, fit: BoxFit.cover)),
                ),
                const SizedBox(height: 10),
                Text(name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppFonts.bodyMedium.copyWith(
                        color: AppColors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          );
  }
}
