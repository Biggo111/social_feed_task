import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_feed_task/features/social_feed/domain/entities/posts_model.dart';
import 'package:social_feed_task/features/social_feed/domain/usecases/feed_use_case.dart';
import 'package:social_feed_task/features/social_feed/presentation/viewmodels/generic/feed_generic.dart';
import 'package:social_feed_task/services/debugger/debugger.dart';


final feedControllerProvider = StateNotifierProvider<FeedController, FeedGeneric>((ref) {
  return FeedController(ref: ref);
});

class FeedController extends StateNotifier<FeedGeneric> {
  final Ref? ref;
  FeedController({this.ref}) : super(FeedGeneric());
  
  final FeedUseCase _feedUseCase = FeedUseCase();

  Future<void> fetchPosts() async {
    state = state.update(isLoading: true);
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    try {
      await Future.delayed(const Duration(seconds: 1));
      if(token == null){
        state = state.update(error: true);
        return;
      }
      final posts = await _feedUseCase.getFeed(token);
      debug(data: "Posts: $posts");
      if(posts is PostsModel){
        state = state.update(postsModel: posts, error: false);
      } else{
        state = state.update(isLoading: true, error: true);
      } 
    } catch (e) {
      state = state.update(error: true);
    }
    state = state.update(isLoading: false);
  }

}