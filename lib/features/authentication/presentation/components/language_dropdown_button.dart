import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_feed_task/core/constants/asset_path.dart';
import 'package:social_feed_task/core/constants/colors_palette.dart';

class LanguageDropdownButton extends ConsumerWidget {
  const LanguageDropdownButton({super.key}); 

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      width: 100.0,
      height: 30.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'EN',
            style: TextStyle(color: AppColors.black, fontSize: 16),
          ),
          GestureDetector(
            onTap: (){
              
            },
            child: Image.asset(
              AssetPath.dropDownIcon,
              width: 15.0,
              height: 15.0,
            ),
          ),
        ],
      ),
    );
  }

}
