import 'package:dream_home/feature/chat/domin/repo/chat_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/chat_details_model/chat_details_model/chat_details_model.dart';
import '../../data/model/chat_model/chat_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _repo;
  ChatCubit(this._repo) : super(ChatInitial());

  ChatModel? chatModel;
  ChatDetailsModel? chatDetailsModel;

  Future<void> getAllChats({required String userid}) async {
    emit(GetAllChatsLoadingState());
    final result = await _repo.getAllChats(userid: userid);
    result.fold((l) => emit(GetAllFailureState(l.message)), (r) {
      chatModel = r;
      emit(GetAllChatsSuccessState(r));
    });
  }

  Future<void> getChatMessages({
    required String senderId,
    required String receiverId,
  }) async {
    emit(GetAllChatMessagesLoadingState());
    final result = await _repo.getChatMessages(
      senderId: senderId,
      receiverId: receiverId,
    );
    result.fold((l) => emit(GetAllChatMessagesFailureState(l.message)), (r) {
      chatDetailsModel = r;
      emit(GetAllChatMessagesSuccessState(r));
    });
  }
}
