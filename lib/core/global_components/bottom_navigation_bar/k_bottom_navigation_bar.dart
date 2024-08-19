import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_feed_task/core/constants/asset_path.dart';
import 'package:social_feed_task/core/constants/colors_palette.dart';
import 'package:social_feed_task/core/global_components/bottom_navigation_bar/k_bottom_navigation_bar_controller.dart';
import 'package:social_feed_task/core/global_components/text_styles/app_fons.dart';
import 'package:social_feed_task/features/social_feed/presentation/screens/feed_screen/feed_screen.dart';
import 'package:social_feed_task/services/navigation_service/navigator.dart';

class KBottomNavigationBar extends ConsumerStatefulWidget {
  const KBottomNavigationBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _KBottomNavigationBarState();
}

class _KBottomNavigationBarState extends ConsumerState<KBottomNavigationBar> {

  

  @override
  Widget build(BuildContext context) {
    final bottomNavigationBarState = ref.watch(kBottomNavigationBarControllerProvider);
    return BottomNavigationBar(
      currentIndex: bottomNavigationBarState.currentIndex,
      type: BottomNavigationBarType.fixed,
      items: [
        _bottomNavBar(AssetPath.feedIcon, 'Feed'),
        _bottomNavBar(AssetPath.communityIcon, 'My Community'),
        _bottomNavBar(AssetPath.exploreIcon, 'Explore'),
        _bottomNavBar(AssetPath.notificationIcon, 'Notification'),
        _bottomNavBar(AssetPath.settingsIcon, 'Settings'),
      ],
      selectedItemColor: AppColors.black,
      unselectedItemColor: AppColors.black54,
      selectedFontSize: 14,
      unselectedFontSize: 12,
      selectedLabelStyle: AppFonts.bodyMedium.copyWith(
        color: AppColors.black,
        fontSize: 14,
        fontWeight: FontWeight.bold
      ),
      onTap: (int index) {
        ref.read(kBottomNavigationBarControllerProvider.notifier).setIndex(index);
        _onItemTapped(index);
      },
    );
  }

  BottomNavigationBarItem _bottomNavBar(String iconPath, String label) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        width: 40,
        height: 40,
        child: Image.asset(iconPath, width: 30, height: 30, color: AppColors.black,)),
      label: label,
    );
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        // NavigationService.navigatorKey.currentState!.push(CupertinoPageRoute(builder: (context) => const FeedScreen()));
        break;
      case 1:
        // Navigator.pushNamed(context, '/my_community');
        break;
      case 2:
        // Navigator.pushNamed(context, '/explore');
        break;
      case 3:
        // Navigator.pushNamed(context, '/notification');
        break;
      case 4:
        // Navigator.pushNamed(context, '/settings');
        break;
    }
  }
}
