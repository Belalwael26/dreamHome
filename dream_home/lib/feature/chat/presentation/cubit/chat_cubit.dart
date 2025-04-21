import 'package:dream_home/feature/chat/data/model/review_model/review_model.dart';
import 'package:dream_home/feature/chat/domin/repo/chat_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/chat_details_model/chat_details_model/chat_details_model.dart';
import '../../data/model/chat_model/chat_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _repo;
  ChatCubit(this._repo) : super(ChatInitial());

  ChatModel? chatModel;
  ChatDetailsModel? chatDetailsModel;
  ReviewModel? reviewModel;
  int selectedRating = 0;

  final TextEditingController messageController = TextEditingController();

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

  Future<void> sendMessage({
    required String senderId,
    required String receiverId,
    required String message,
  }) async {
    emit(SendMessageLoadingState());
    final result = await _repo.sendMessage(
      senderId: senderId,
      receiverId: receiverId,
      message: message,
    );
    result.fold((l) => emit(SendMessageFailureState(l.message)), (r) {
      messageController.clear();
      getChatMessages(
        senderId: senderId,
        receiverId: receiverId,
      );
      emit(SendMessageSuccessState());
    });
  }

  Future<void> requestReview({
    required String employeeId,
    required String customerId,
  }) async {
    final result = await _repo.requestReview(
      employeeId: employeeId,
      customerId: customerId,
    );
    result.fold((l) => emit(RequestReviewFailureState(l.message)), (r) {
      reviewModel = r;
      emit(RequestReviewSuccessState(r));
    });
  }
}
