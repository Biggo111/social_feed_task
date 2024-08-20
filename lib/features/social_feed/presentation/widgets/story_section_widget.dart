import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_feed_task/core/constants/colors_palette.dart';
import 'package:social_feed_task/core/global_components/text_styles/app_fons.dart';
import 'package:social_feed_task/features/authentication/presentation/viewmodels/auth_viewmodel.dart';

class StorySectionWidget extends ConsumerWidget {
  const StorySectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.read(authControllerProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 120,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
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
                    child: Image.asset(usersState.users[index].profilePicture, fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 10),
                  Text(usersState.users[index].name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: AppFonts.bodyMedium.copyWith(
                          color: AppColors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            );
          },
          itemCount: usersState.users.length),
    );
  }
}
