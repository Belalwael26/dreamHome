import 'package:dartz/dartz.dart';
import 'package:dream_home/core/network/error/failure.dart';
import 'package:dream_home/feature/chat/data/model/chat_details_model/chat_details_model/chat_details_model.dart';
import 'package:dream_home/feature/chat/data/model/chat_model/chat_model.dart';

abstract class ChatRepo {
  Future<Either<Failure, ChatModel>> getAllChats({
    required String userid,
  });

  Future<Either<Failure, ChatDetailsModel>> getChatMessages({
    required String senderId,
    required String receiverId,
  });
}
