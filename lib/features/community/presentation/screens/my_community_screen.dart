import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_feed_task/core/global_components/buttons/k_button.dart';
import 'package:social_feed_task/features/authentication/presentation/viewmodels/auth_viewmodel.dart';

class MyCommunityScreen extends ConsumerStatefulWidget {
  const MyCommunityScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyCommunityScreenState();
}

class _MyCommunityScreenState extends ConsumerState<MyCommunityScreen> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: KButton(
        width: 200,
        height: 50,
        text: "Logout", 
        onPressed: (){
          ref.read(authControllerProvider.notifier).handleLogout();
        }
      ),
    );
  }
}