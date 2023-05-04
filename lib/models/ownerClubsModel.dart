class OwnerClubsModel {
  final int id;
  final int price;
  final String name;
  final int wc;
  final int cafe;
  final String creationDate;
  final String image;
  final int adminId;
  final int areaId;
  final int rate;
  OwnerClubsModel({
  required this.id,
    required this.price,
    required this.name,
    required this.wc,
    required this.cafe,
    required this.creationDate,
    required this.image,
    required this.adminId,
    required this.areaId,
    required this.rate,
  });
  factory OwnerClubsModel.fromJson(Map<String, dynamic> json) {
    return OwnerClubsModel(
      id: json['id'],
      price: json['price'],
      name: json['name'],
      wc: json['wc'],
      cafe: json['cafe'],
      creationDate: json['creationDate'],
      image: json['image'],
      adminId: json['admin_id'],
      areaId: json['area_id'],
      rate: json['rate'],
    );
  }
}