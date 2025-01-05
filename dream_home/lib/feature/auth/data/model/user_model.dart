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
      image: doc.data()!['image'],
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
}
