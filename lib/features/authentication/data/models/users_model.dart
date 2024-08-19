class UsersModel {
    List<User> users;

    UsersModel({
        required this.users,
    });

    factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
    };
}

class User {
    int id;
    String name;
    String email;
    String password;
    DateTime dateOfBirth;
    String gender;
    String profilePicture;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.password,
        required this.dateOfBirth,
        required this.gender,
        required this.profilePicture,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        gender: json["gender"],
        profilePicture: json["profilePicture"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "dateOfBirth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "profilePicture": profilePicture,
    };
}
