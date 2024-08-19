class User {
    int id;
    String name;
    String email;
    String password;
    DateTime dateOfBirth;
    String gender;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.password,
        required this.dateOfBirth,
        required this.gender,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        gender: json["gender"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "dateOfBirth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "gender": gender,
    };
}
