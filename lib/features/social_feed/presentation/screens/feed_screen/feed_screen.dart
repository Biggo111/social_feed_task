import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_feed_task/core/global_components/bottom_navigation_bar/k_bottom_navigation_bar.dart';
import 'package:social_feed_task/features/social_feed/presentation/components/post_card.dart';
import 'package:social_feed_task/features/social_feed/presentation/widgets/post_section_widget.dart';
import 'package:social_feed_task/features/social_feed/presentation/widgets/story_section_widget.dart';
import 'package:social_feed_task/features/social_feed/presentation/widgets/profile_search_message_widget.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileSearchMessageWidget(),
              const SizedBox(height: 10),
              const StorySectionWidget(),
              const SizedBox(height: 5),
              const PostSectionWidget(),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const PostCard();
                }
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: const KBottomNavigationBar(),
    );
  }
}
