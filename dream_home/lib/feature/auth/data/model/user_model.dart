import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel with EquatableMixin {
  final String? id;
  final String? email;
  final String? password;
  final String? name;
  final String? job;

  UserModel({this.id, this.email, this.password, this.name, this.job});

  factory UserModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return UserModel(
      id: doc.id,
      email: doc.data()!['email'],
      password: doc.data()!['password'],
      name: doc.data()!['name'],
      job: doc.data()!['job'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        email,
        password,
        name,
        job,
      ];
}
