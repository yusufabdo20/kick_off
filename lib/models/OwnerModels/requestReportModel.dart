class RequestReportModel {
  int? id;
  int? status;
  String? bookDate;
  int? clubId;
  int? adminId;
  int? userId;
  User? user;

  RequestReportModel(
      {this.id,
      this.status,
      this.bookDate,
      this.clubId,
      this.adminId,
      this.userId,
      this.user});

  RequestReportModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    bookDate = json['bookDate'];
    clubId = json['club_id'];
    adminId = json['admin_id'];
    userId = json['user_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['bookDate'] = this.bookDate;
    data['club_id'] = this.clubId;
    data['admin_id'] = this.adminId;
    data['user_id'] = this.userId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class ViewsReportModel {
  int? id;
  int? adminId;
  int? userId;
  User? user;

  ViewsReportModel({this.id, this.adminId, this.userId, this.user});

  ViewsReportModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminId = json['admin_id'];
    userId = json['user_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_id'] = this.adminId;
    data['user_id'] = this.userId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}
class CallsReportModel {
  int? id;
  String? creationdate;
  int? adminId;
  int? userId;
  int? clubId;
  User? user;
  Club? club;

  CallsReportModel(
      {this.id,
      this.creationdate,
      this.adminId,
      this.userId,
      this.clubId,
      this.user,
      this.club});

  CallsReportModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creationdate = json['creationdate'];
    adminId = json['admin_id'];
    userId = json['user_id'];
    clubId = json['club_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    club = json['club'] != null ? new Club.fromJson(json['club']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['creationdate'] = this.creationdate;
    data['admin_id'] = this.adminId;
    data['user_id'] = this.userId;
    data['club_id'] = this.clubId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.club != null) {
      data['club'] = this.club!.toJson();
    }
    return data;
  }
}
class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? rollId;

  User({this.id, this.name, this.email, this.phone, this.rollId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    rollId = json['roll_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['roll_id'] = this.rollId;
    return data;
  }
}
class Club {
  int? id;
  int? price;
  String? name;
  int? wc;
  int? cafe;
  String? creationDate;
  String? address;
  String? notes;
  String? image;
  int? adminId;
  int? areaId;

  Club(
      {this.id,
      this.price,
      this.name,
      this.wc,
      this.cafe,
      this.creationDate,
      this.address,
      this.notes,
      this.image,
      this.adminId,
      this.areaId});

  Club.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    name = json['name'];
    wc = json['wc'];
    cafe = json['cafe'];
    creationDate = json['creationDate'];
    address = json['address'];
    notes = json['notes'];
    image = json['image'];
    adminId = json['admin_id'];
    areaId = json['area_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['name'] = this.name;
    data['wc'] = this.wc;
    data['cafe'] = this.cafe;
    data['creationDate'] = this.creationDate;
    data['address'] = this.address;
    data['notes'] = this.notes;
    data['image'] = this.image;
    data['admin_id'] = this.adminId;
    data['area_id'] = this.areaId;
    return data;
  }
}