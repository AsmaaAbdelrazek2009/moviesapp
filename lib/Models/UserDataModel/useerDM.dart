class UserDM {
  static UserDM? currentUser;

  String? id;
  String? name;
  String? email;
  String? phone;
  String? imgPath;

  UserDM({this.id, this.name, this.email, this.phone, this.imgPath});

  UserDM.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    imgPath = json['imgPath'];

  }


  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
      "imgPath":imgPath,
    };
  }
}