class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['data']['userData']['id'],
      name: json['data']['userData']['name'],
      email: json['data']['userData']['email'],
      phone: json['data']['userData']['phone'],
      token: json['data']['token'],
    );
  }
}