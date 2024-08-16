class User {
    int userId;
    String username;
    String email;
    String password;
    String name;
    String bio;
    String profilePicture;

    User({
        required this.userId,
        required this.username,
        required this.email,
        required this.password,
        required this.name,
        required this.bio,
        required this.profilePicture,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        bio: json["bio"],
        profilePicture: json["profile_picture"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "email": email,
        "password": password,
        "name": name,
        "bio": bio,
        "profile_picture": profilePicture,
    };
}
