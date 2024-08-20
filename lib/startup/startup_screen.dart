import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_feed_task/core/global_components/bottom_navigation_bar/k_bottom_navigation_bar.dart';
import 'package:social_feed_task/core/global_components/bottom_navigation_bar/k_bottom_navigation_bar_controller.dart';
import 'package:social_feed_task/features/authentication/presentation/viewmodels/auth_viewmodel.dart';
import 'package:social_feed_task/features/community/presentation/screens/my_community_screen.dart';
import 'package:social_feed_task/features/explore/presentation/screens/explore_screen.dart';
import 'package:social_feed_task/features/notification/presentation/screens/notification_screen.dart';
import 'package:social_feed_task/features/settings/presentation/screens/settings_screen.dart';
import 'package:social_feed_task/features/social_feed/presentation/screens/feed_screen/feed_screen.dart';
import 'package:social_feed_task/features/social_feed/presentation/viewmodels/feed_viewmodel.dart';

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


  Future _onWillPop() {
    return showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text('Are you sure?'),
      content: const Text('Do you want to exit the app?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () => exit(0),
          child: const Text('Yes'),
        ),
      ],
    ));
  }


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      ref.read(kBottomNavigationBarControllerProvider.notifier).setIndex(0);
      ref.read(feedControllerProvider.notifier).fetchPosts();
      ref.read(authControllerProvider.notifier).fetchAllUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavigationBarState = ref.watch(kBottomNavigationBarControllerProvider);
    return PopScope(
      onPopInvoked: (isPop){
        if(isPop){
          _onWillPop();
        } else {
          bottomNavigationBarState.currentIndex;
        }
      },
      child: Scaffold(
        body: _screens[bottomNavigationBarState.currentIndex],
        bottomNavigationBar: const KBottomNavigationBar(),
      ),
    );
  }
}