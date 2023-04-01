
class Data {
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
  // Admin? admin;

  Data(
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
      // this.admin
      });

  Data.fromJson(Map<String, dynamic> json) {
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
    // admin = json['admin'] != null ? new Admin.fromJson(json['admin']) : null;
  }
}