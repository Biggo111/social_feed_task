import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_feed_task/features/authentication/presentation/viewmodels/auth_viewmodel.dart';
import 'package:social_feed_task/features/social_feed/presentation/components/post_card.dart';
import 'package:social_feed_task/features/social_feed/presentation/viewmodels/feed_viewmodel.dart';
import 'package:social_feed_task/features/social_feed/presentation/widgets/post_section_widget.dart';
import 'package:social_feed_task/features/social_feed/presentation/widgets/story_section_widget.dart';
import 'package:social_feed_task/features/social_feed/presentation/widgets/profile_search_message_widget.dart';
import 'package:social_feed_task/services/debugger/debugger.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen> {

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp){
  //     ref.read(authControllerProvider.notifier).getUserData();
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final feedState = ref.watch(feedControllerProvider);
    final userState = ref.watch(authControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileSearchMessageWidget(
                myProfilePicture: userState.user != null ? userState.user!.profilePicture : 'assets/images/profile_pic_demo_1.png',
              ),
              const SizedBox(height: 10),
              const StorySectionWidget(),
              const SizedBox(height: 5),
              const PostSectionWidget(),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: feedState.postsModel.length,
                itemBuilder: (context, index) {
                  return PostCard(
                    postDetails: feedState.postsModel[index],
                  );
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
