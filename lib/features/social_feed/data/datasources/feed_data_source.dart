import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:social_feed_task/features/social_feed/domain/entities/posts_model.dart';
import 'package:social_feed_task/services/debugger/debugger.dart';

abstract class FeedDataSource {
  Future<PostsModel> fetchFeed(String authToken);
}


class FeedDataSourceImpl implements FeedDataSource {
  final Dio dio;

  FeedDataSourceImpl(this.dio);

  @override
  Future<PostsModel> fetchFeed(String authToken) async {
    try {
      final String response = await rootBundle.loadString('assets/json/feed/posts.json');
      debug(data: "Response: $response");
      final data = json.decode(response);

      if (authToken.isNotEmpty) {
        return PostsModel.fromJson(data);
      } else {
        throw Exception('Unauthorized');
      }
    } catch (e) {
      debug(data: "Error: $e");
      throw Exception('Failed to load feeds');
    }
  }

  // @override
  // Future<Map<String, dynamic>?> fetchPostDetails(String postId) async {
  //   try {
  //     // Load the feed data from JSON file
  //     final String response = await rootBundle.loadString('assets/json/feed/feeds.json');
  //     final data = json.decode(response);

  //     // Find the specific post by ID
  //     final post = data['posts'].firstWhere(
  //       (post) => post['postId'] == postId,
  //       orElse: () => null,
  //     );

  //     return post;
  //   } catch (e) {
  //     throw Exception('Failed to load post details');
  //   }
  // }
}
