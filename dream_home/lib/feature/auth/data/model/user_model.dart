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

  UserModel({
    this.id,
    this.email,
    this.password,
    this.name,
    this.job,
    this.phone,
    this.image,
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
    );
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
    );
  }
}
