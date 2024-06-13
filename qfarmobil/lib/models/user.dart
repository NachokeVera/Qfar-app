class User {
  final int? id;
  final String user;
  final String email;
  final String password;

  User({
    this.id,
    required this.user,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] != null ? json['id'] as int : null,
      user: json['user'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'user': user,
        'email': email,
        'password': password,
      };
}
