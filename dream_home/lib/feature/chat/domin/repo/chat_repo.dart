import 'package:dartz/dartz.dart';
import 'package:dream_home/core/network/error/failure.dart';
import 'package:dream_home/feature/chat/data/model/chat_model/chat_model.dart';

abstract class ChatRepo {
  Future<Either<Failure, ChatModel>> getAllChats({
    required String userid,
  });
}
