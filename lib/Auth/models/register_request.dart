import 'package:flutter/cupertino.dart';

class RegisterRequest {
  String id;
  String email;
  String password;
  String fName;
  String lName;
  String city;
  String country;
  String imageUrl;
  RegisterRequest({
    this.id,
    @required this.email,
    @required this.password,
    @required this.fName,
    @required this.lName,
    @required this.city,
    @required this.country,
    @required this.imageUrl,
  });

  toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'fName': fName,
      'lName': lName,
      'city': city,
      'country': country,
      'imageUrl': this.imageUrl,
    };
  }
}
