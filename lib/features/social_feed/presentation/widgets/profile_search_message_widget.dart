import 'package:flutter/material.dart';
import 'package:social_feed_task/core/constants/asset_path.dart';
import 'package:social_feed_task/core/constants/colors_palette.dart';
import 'package:social_feed_task/core/global_components/text_fields/k_text_field.dart';

class ProfileSearchMessageWidget extends StatelessWidget {
  final String myProfilePicture;
  const ProfileSearchMessageWidget({
    super.key,
    required this.myProfilePicture,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(myProfilePicture, fit: BoxFit.cover),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: KTextField(
              hintText: 'Search for Something here...',
              height: 40,
              borderColor: AppColors.grey,
              icon: Image.asset(AssetPath.searchIcon, width: 16, fit: BoxFit.contain, color: AppColors.black87,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 5),
            child: Image.asset(AssetPath.messageBoxIcon, width: 25, fit: BoxFit.contain, color: AppColors.black87,),
          ),
        ],
      ),
    );
  }
}