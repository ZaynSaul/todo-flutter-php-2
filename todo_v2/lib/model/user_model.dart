class UserModel {
  final String id;
  final String name;
  final String email;
  final String password;
  final String profile;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.profile,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'password': password,
        'profile': profile,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      profile: json['profile'],
    );
  }
}
