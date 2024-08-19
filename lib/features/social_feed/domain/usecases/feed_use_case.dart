import 'package:social_feed_task/features/social_feed/data/repositories/feed_repository_impl.dart';
import 'package:social_feed_task/services/di/service_locator_di.dart';

class FeedUseCase {
  FeedUseCase()
      : _feedRepository = sl.get<FeedRepositoryImpl>();
  
  final FeedRepositoryImpl _feedRepository;


  Future<Object> getFeed(String authToken) async {
    return await _feedRepository.getFeed(authToken);
  }
}