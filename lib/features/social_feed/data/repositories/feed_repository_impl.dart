import 'package:social_feed_task/features/social_feed/data/datasources/feed_data_source.dart';
import 'package:social_feed_task/features/social_feed/domain/repositories/feed_repository.dart';

class FeedRepositoryImpl implements FeedRepository {
  FeedDataSource feedDataSource;

  FeedRepositoryImpl(this.feedDataSource);

  @override
  Future<Object> getFeed(String authToken) async {
    return await feedDataSource.fetchFeed(authToken);
  }
}