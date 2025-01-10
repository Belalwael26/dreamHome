import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class NotificationModel with EquatableMixin {
  final String? title;
  final String? body;
  String? id;
  // final String? data;

  NotificationModel({
    this.title,
    this.body,
    this.id,
    // this.data,
  });
  factory NotificationModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return NotificationModel(
      id: doc.id,
      title: doc.data()!['title'],
      body: doc.data()!['body'],
      // data: doc.data()!['data'],
    );
  }

  @override
  List<Object?> get props => [
        title,
        body,
        //  data,
      ];
}
