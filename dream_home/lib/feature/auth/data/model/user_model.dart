import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel with EquatableMixin {
  final String? id;
  final String? email;
  final String? password;
  final String? name;
  final String? job;
  final String? phone;
  final String? image;
  final String? token;
  final String? location;

  UserModel({
    this.id,
    this.email,
    this.password,
    this.name,
    this.job,
    this.phone,
    this.image,
    this.token,
    this.location,
  });

  factory UserModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return UserModel(
        id: doc.id,
        email: doc.data()!['email'],
        password: doc.data()!['password'],
        name: doc.data()!['name'],
        job: doc.data()!['job'],
        phone: doc.data()!['phone'],
        image: doc.data()!['profile_picture'],
        token: doc.data()!['token'],
        location: doc.data()!['location']);
  }

  @override
  List<Object?> get props => [
        id,
        email,
        password,
        name,
        job,
        phone,
        image,
        token,
        location,
      ];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'job': job,
      'phone': phone,
      'profile_picture': image,
      'token': token,
      'location': location,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      job: json['job'],
      phone: json['phone'],
      image: json['profile_picture'],
      token: json['token'],
      location: json['location'],
    );
  }
}
