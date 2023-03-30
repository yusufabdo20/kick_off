class User {
  final int id;
  final String name;
  final String email;
  final int roll_id;
  final String token;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.roll_id,
      required this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['data']['userData']['id'],
      name: json['data']['userData']['name'],
      email: json['data']['userData']['email'],
      roll_id: json['data']['userData']['roll_id'],
      token: json['data']['token'],
    );
  }
}
