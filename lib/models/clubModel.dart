
import 'package:kick_off/models/userModel.dart';

class ClubModel {
  int? id;
  int? price;
  String? name;
  int? wc;
  int? cafe;
  String? creationDate;
  String? rate;
  String? image;
  int? adminId;
  int? areaId;
  UserModel? admin;

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
      this.admin
      });

  ClubModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    name = json['name'];
    wc = json['wc'];
    cafe = json['cafe'];
    creationDate = json['creationDate'];
    rate = json['rate'];
    image = json['image'];
    adminId = json['admin_id'];
    areaId = json['area_id'];
    admin = json['admin'] != null ? UserModel.fromJson(json['admin']) : null;
  }
}