import 'package:kick_off/models/userModel.dart';

class ClubModel {
  int? id;
  int? price;
  String? name;
  int? wc;
  int? cafe;
  String? creationDate;
  int? rate;
  String? image;
  int? adminId;
  int? areaId;
  Admin admin;

  ClubModel(
      {this.id,
      this.price,
      this.name,
      this.wc,
      this.cafe,
      this.creationDate,
      this.rate,
      this.image,
      this.adminId,
      this.areaId,
      required this.admin});

  factory ClubModel.fromJson(Map<String, dynamic> json) {
    return ClubModel(
        id: json['id'],
        price: json['price'],
        name: json['name'],
        wc: json['wc'],
        cafe: json['cafe'],
        creationDate: json['creationDate'],
        rate: json['rate'],
        image: json['image'],
        adminId: json['admin_id'],
        areaId: json['area_id'],
        admin: Admin.fromJson(json['admin']));
  }
}

class Admin {
  final int id;
  final String name;
  final String email;
  final String phone;
  final int roll_id;

  Admin({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.roll_id,
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      roll_id: json['roll_id'],
    );
  }
}
