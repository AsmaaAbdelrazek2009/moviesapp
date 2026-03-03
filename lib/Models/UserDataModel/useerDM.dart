class UserDM {
  static UserDM? currentUser; // Singleton لمتابعة المستخدم الحالي

  String? id;
  String? name;
  String? email;
  String? phone;

  UserDM({this.id, this.name, this.email, this.phone});

  UserDM.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
    };
  }
}