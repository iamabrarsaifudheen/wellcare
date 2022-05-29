import 'package:firebase_auth/firebase_auth.dart';

class UserDetails {
  final String id;
  final String name;
  final String email;
  final String description;
  final String number;
  final String referenceContact;
  final String location;
  final String type;
  final String urlAadhar;
  final String urlPic;
  final String urlCertificate;
  final String urlDischargeSummeryCertificate;
  UserDetails({
    required this.urlAadhar,
    required this.urlPic,
    required this.urlCertificate,
    required this.urlDischargeSummeryCertificate,
    required this.id,
    required this.name,
    required this.email,
    required this.description,
    required this.number,
    required this.referenceContact,
    required this.location,
    required this.type,
  });
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "description": description,
        "number": number,
        "referenceContact": referenceContact,
        "location": location,
        "type": type,
      };
  static UserDetails fromJson(Map<String, dynamic> json) => UserDetails(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        description: json['description'],
        number: json['number'],
        referenceContact: json['referenceContact'],
        location: json['location'],
        type: json['type'],
        urlAadhar: json['urlAadhar'],
        urlCertificate: json['urlCertificate'],
        urlDischargeSummeryCertificate: json['urlDischargeSummeryCertificate'],
        urlPic: json['urlPic'],
      );
}
