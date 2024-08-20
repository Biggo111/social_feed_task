import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_feed_task/features/authentication/presentation/viewmodels/auth_viewmodel.dart';
import 'package:social_feed_task/features/social_feed/presentation/components/post_card.dart';
import 'package:social_feed_task/features/social_feed/presentation/screens/create_post/create_post_screen.dart';
import 'package:social_feed_task/features/social_feed/presentation/viewmodels/feed_viewmodel.dart';
import 'package:social_feed_task/features/social_feed/presentation/widgets/post_section_widget.dart';
import 'package:social_feed_task/features/social_feed/presentation/widgets/story_section_widget.dart';
import 'package:social_feed_task/features/social_feed/presentation/widgets/profile_search_message_widget.dart';
import 'package:social_feed_task/services/navigation_service/navigator.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    final feedState = ref.watch(feedControllerProvider);
    final userState = ref.watch(authControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ProfileSearchMessageWidget(
                    myProfilePicture: userState.user != null
                        ? userState.user!.profilePicture
                        : 'assets/images/profile_pic_demo_1.png',
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    height: 120,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: userState.users.length,
                      itemBuilder: (context, index) {
                        return StorySectionWidget(
                          profilePicture: userState.users[index].profilePicture,
                          name: userState.users[index].name,
                        );
                      }
                    ),
                  ),
                  const SizedBox(height: 5),
                  PostSectionWidget(
                    onPressed: () {
                      NavigationService.navigatorKey.currentState!.push(
                        CupertinoPageRoute(
                          builder: (context) => const CreatePostScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return PostCard(
                    postDetails: feedState.postsModel[index],
                  );
                },
                childCount: feedState.postsModel.length,
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const KBottomNavigationBar(),
    );
  }
}
