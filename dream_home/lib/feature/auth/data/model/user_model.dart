import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? email;
  final String? password;
  final String? name;
  final String? phone;

  UserModel({this.id, this.email, this.password, this.name, this.phone});

  factory UserModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return UserModel(
      id: doc.id,
      email: doc.data()!['email'],
      password: doc.data()!['password'],
      name: doc.data()!['name'],
      phone: doc.data()!['phone'],
    );
  }
}
