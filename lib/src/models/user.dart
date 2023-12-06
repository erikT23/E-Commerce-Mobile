// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String? email;
  String? phoneNumber;
  String? name;
  String? lastName;
  String? password;
  String? profilePicture;
  String? roleId;
  String? buyerProfile;
  String? sellerProfile;
  String? courierProfile;
  String? paymentMethod;
  String? profileimage;
  String? reviews;
  String? sessions;
  String? requestResetPassword;
  String? updatedAt;
  String? createdAt;
  String? token;

  User({
    this.id,
    this.email,
    this.phoneNumber,
    this.name,
    this.lastName,
    this.password,
    this.profilePicture,
    this.roleId,
    this.buyerProfile,
    this.sellerProfile,
    this.courierProfile,
    this.paymentMethod,
    this.profileimage,
    this.reviews,
    this.sessions,
    this.requestResetPassword,
    this.updatedAt,
    this.createdAt,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        name: json["name"],
        lastName: json["lastName"],
        password: json["password"],
        profilePicture: json["profilePicture"],
        roleId: json["roleId"].toString(),
        buyerProfile: json["buyerProfile"],
        sellerProfile: json["sellerProfile"],
        courierProfile: json["courierProfile"].toString(),
        paymentMethod: json["paymentMethod"],
        profileimage: json["profileimage"],
        reviews: json["Reviews"],
        sessions: json["Sessions"],
        requestResetPassword: json["requestResetPassword"],
        updatedAt: json["updatedAt"],
        createdAt: json["createdAt"],
        token: json["token"]?["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "phoneNumber": phoneNumber,
        "name": name,
        "lastName": lastName,
        "password": password,
        "profilePicture": profilePicture,
        "roleId": roleId,
        "buyerProfile": buyerProfile,
        "sellerProfile": sellerProfile,
        "courierProfile": courierProfile,
        "paymentMethod": paymentMethod,
        "profileimage": profileimage,
        "Reviews": reviews,
        "Sessions": sessions,
        "requestResetPassword": requestResetPassword,
        "updatedAt": updatedAt,
        "createdAt": createdAt,
        "token": token,
      };
}
