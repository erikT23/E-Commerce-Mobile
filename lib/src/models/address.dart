import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
    String? address;
    String? neighborhood;
    String? idUser;
    double? lat;
    double? long;

    Address({
        required this.address,
        required this.neighborhood,
        required this.idUser,
        required this.lat,
        required this.long,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json["address"],
        neighborhood: json["neighborhood"],
        idUser: json["id_user"],
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        
        "address": address,
        "neighborhood": neighborhood,
        "id_user": idUser,
        "lat": lat,
        "long": long,
    };
}