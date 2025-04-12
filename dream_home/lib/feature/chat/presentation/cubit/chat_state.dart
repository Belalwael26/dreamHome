part of 'chat_cubit.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

final class GetAllChatsLoadingState extends ChatState {}

final class GetAllChatsSuccessState extends ChatState {
  final ChatModel chats;

  const GetAllChatsSuccessState(this.chats);

  @override
  List<Object> get props => [chats];
}

final class GetAllFailureState extends ChatState {
  final String error;

  const GetAllFailureState(this.error);

  @override
  List<Object> get props => [error];
}
