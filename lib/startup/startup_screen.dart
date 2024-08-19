import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_feed_task/core/global_components/bottom_navigation_bar/k_bottom_navigation_bar.dart';
import 'package:social_feed_task/core/global_components/bottom_navigation_bar/k_bottom_navigation_bar_controller.dart';
import 'package:social_feed_task/features/community/presentation/screens/my_community_screen.dart';
import 'package:social_feed_task/features/explore/presentation/screens/explore_screen.dart';
import 'package:social_feed_task/features/notification/presentation/screens/notification_screen.dart';
import 'package:social_feed_task/features/settings/presentation/screens/settings_screen.dart';
import 'package:social_feed_task/features/social_feed/presentation/screens/feed_screen/feed_screen.dart';

class StartupScreen extends ConsumerStatefulWidget {
  const StartupScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StartupScreenState();
}

class _StartupScreenState extends ConsumerState<StartupScreen> {

  static const List<Widget> _screens = <Widget>[
    FeedScreen(),
    MyCommunityScreen(),
    ExploreScreen(),
    NotificationScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavigationBarState = ref.watch(kBottomNavigationBarControllerProvider);
    return Scaffold(
      body: _screens[bottomNavigationBarState.currentIndex],
      bottomNavigationBar: const KBottomNavigationBar(),
    );
  }
}