class PlaygroundModel {
  int? price;
  String? name;
  int? wc;
  int? cafe;
  String? image;
  int? areaId;

  PlaygroundModel({
    this.price,
    this.name,
    this.wc,
    this.cafe,
    this.image,
    this.areaId,
  });

  factory PlaygroundModel.fromJson(Map<String, dynamic> json) {
    return PlaygroundModel(
      price: json['price'],
      name: json['name'],
      wc: json['wc'],
      cafe: json['cafe'],
      image: json['image'],
      areaId: json['area_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['name'] = this.name;
    data['wc'] = this.wc;
    data['cafe'] = this.cafe;
    data['image'] = this.image;
    data['area_id'] = this.areaId;

    return data;
  }
}
