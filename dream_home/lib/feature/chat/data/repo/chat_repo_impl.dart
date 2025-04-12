import 'package:dartz/dartz.dart';
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
}
