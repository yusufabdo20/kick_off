
import 'package:kick_off/models/personModel.dart';

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
  User? admin;

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
    admin = json['admin'] != null ? User.fromJson(json['admin']) : null;
  }
}