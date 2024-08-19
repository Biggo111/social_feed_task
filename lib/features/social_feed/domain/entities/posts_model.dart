class PostsModel {
    List<Post> posts;

    PostsModel({
        required this.posts,
    });

    factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
    };
}

class Post {
    int postId;
    int userId;
    String userName;
    String userProfilePicture;
    DateTime postTime;
    String postType;
    List<AttachedContent> attachedContent;
    String caption;
    int likesCount;
    int commentsCount;
    int sharesCount;
    List<Like> likes;
    List<Comment> comments;

    Post({
        required this.postId,
        required this.userId,
        required this.userName,
        required this.userProfilePicture,
        required this.postTime,
        required this.postType,
        required this.attachedContent,
        required this.caption,
        required this.likesCount,
        required this.commentsCount,
        required this.sharesCount,
        required this.likes,
        required this.comments,
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        postId: json["postId"],
        userId: json["userId"],
        userName: json["userName"],
        userProfilePicture: json["userProfilePicture"],
        postTime: DateTime.parse(json["postTime"]),
        postType: json["postType"],
        attachedContent: List<AttachedContent>.from(json["attachedContent"].map((x) => AttachedContent.fromJson(x))),
        caption: json["caption"],
        likesCount: json["likesCount"],
        commentsCount: json["commentsCount"],
        sharesCount: json["sharesCount"],
        likes: List<Like>.from(json["likes"].map((x) => Like.fromJson(x))),
        comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "postId": postId,
        "userId": userId,
        "userName": userName,
        "userProfilePicture": userProfilePicture,
        "postTime": postTime.toIso8601String(),
        "postType": postType,
        "attachedContent": List<dynamic>.from(attachedContent.map((x) => x.toJson())),
        "caption": caption,
        "likesCount": likesCount,
        "commentsCount": commentsCount,
        "sharesCount": sharesCount,
        "likes": List<dynamic>.from(likes.map((x) => x.toJson())),
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
    };
}

class AttachedContent {
    String type;
    String url;

    AttachedContent({
        required this.type,
        required this.url,
    });

    factory AttachedContent.fromJson(Map<String, dynamic> json) => AttachedContent(
        type: json["type"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
    };
}

class Comment {
    int commentId;
    int userId;
    String userName;
    DateTime commentTime;
    String content;

    Comment({
        required this.commentId,
        required this.userId,
        required this.userName,
        required this.commentTime,
        required this.content,
    });

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        commentId: json["commentId"],
        userId: json["userId"],
        userName: json["userName"],
        commentTime: DateTime.parse(json["commentTime"]),
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "commentId": commentId,
        "userId": userId,
        "userName": userName,
        "commentTime": commentTime.toIso8601String(),
        "content": content,
    };
}

class Like {
    int userId;
    String userName;

    Like({
        required this.userId,
        required this.userName,
    });

    factory Like.fromJson(Map<String, dynamic> json) => Like(
        userId: json["userId"],
        userName: json["userName"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "userName": userName,
    };
}
