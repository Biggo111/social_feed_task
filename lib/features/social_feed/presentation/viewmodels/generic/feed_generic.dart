import 'package:social_feed_task/features/social_feed/domain/entities/posts_model.dart';

class FeedGeneric{
   bool isLoading;
   PostsModel? postsModel;
   bool error;

  FeedGeneric({
    this.isLoading = false,
    this.postsModel,
    this.error = false});

  FeedGeneric update({bool? error, bool? isLoading, PostsModel? postsModel}){
    return FeedGeneric(
      postsModel: postsModel ?? this.postsModel,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }

}