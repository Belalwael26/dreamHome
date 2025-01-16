import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class NotificationModel with EquatableMixin {
  final String? title;
  final String? body;
  String? id;
  final bool? isOpen;
  // final String? data;

  NotificationModel({
    this.title,
    this.body,
    this.id,
    // this.data,
    this.isOpen,
  });
  factory NotificationModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return NotificationModel(
        id: doc.id,
        title: doc.data()!['title'],
        body: doc.data()!['body'],
        isOpen: doc.data()!['is_open']
        // data: doc.data()!['data'],
        );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        body,
        isOpen,
        //  data,
      ];
}
