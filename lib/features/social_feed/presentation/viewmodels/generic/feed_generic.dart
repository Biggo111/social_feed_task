import 'package:social_feed_task/features/social_feed/domain/entities/posts_model.dart';

class FeedGeneric{
   bool isLoading;
   List<Post> postsModel;
   bool error;

  FeedGeneric({
    this.isLoading = false,
    this.postsModel = const [],
    this.error = false});

  FeedGeneric update({bool? error, bool? isLoading, List<Post>? postsModel}){
    return FeedGeneric(
      postsModel: postsModel ?? this.postsModel,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }

}