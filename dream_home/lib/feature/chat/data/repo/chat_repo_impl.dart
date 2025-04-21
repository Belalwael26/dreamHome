import 'package:dartz/dartz.dart';
import 'package:dream_home/feature/chat/data/model/Send_message_model/send_message_model/send_message_model.dart';
import 'package:dream_home/feature/chat/data/model/chat_details_model/chat_details_model/chat_details_model.dart';
import 'package:dream_home/feature/chat/data/model/review_model/review_model.dart';
import 'package:dream_home/feature/chat/data/source/base/chat_source.dart';
import 'package:dream_home/feature/chat/domin/repo/chat_repo.dart';

import '../../../../core/network/error/failure.dart';
import '../model/chat_model/chat_model.dart';

class ChatRepoImpl implements ChatRepo {
  final ChatSource _source;

  ChatRepoImpl(this._source);
  @override
  Future<Either<Failure, ChatModel>> getAllChats(
      {required String userid}) async {
    try {
      final response = await _source.getAllChats(userid: userid);
      if (response['chats'] != null) {
        return Right(ChatModel.fromJson(response));
      } else {
        return Left(ServerFailure(response['message']));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChatDetailsModel>> getChatMessages(
      {required String senderId, required String receiverId}) async {
    try {
      final response = await _source.getChatMessages(
          senderId: senderId, receiverId: receiverId);
      if (response['messages'] != null) {
        return Right(ChatDetailsModel.fromJson(response));
      } else {
        return Left(ServerFailure(response['message']));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SendMessageModel>> sendMessage(
      {required String senderId,
      required String receiverId,
      required String message}) async {
    try {
      final response = await _source.sendMessage(
          senderId: senderId, receiverId: receiverId, message: message);
      if (response['message'] != null) {
        return Right(SendMessageModel.fromJson(response));
      } else {
        return Left(ServerFailure(response['message']));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReviewModel>> requestReview(
      {required String employeeId, required String customerId}) async {
    try {
      final response = await _source.requestReview(
        customerId: customerId,
        employeeId: employeeId,
      );

      if (response['message'] != "Review request created successfully") {
        return Left(ServerFailure(response['message']));
      }

      return Right(ReviewModel.fromJson(response));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
