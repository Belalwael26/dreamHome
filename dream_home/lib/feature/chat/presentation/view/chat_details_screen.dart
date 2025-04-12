import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/styles/app_text_style.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/core/widget/app_bar.dart';
import 'package:dream_home/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubit/chat_cubit.dart';

class ChatDetailsScreen extends StatefulWidget {
  final String senderId;
  final String receiverId;
  final String receiverName;

  const ChatDetailsScreen({
    super.key,
    required this.senderId,
    required this.receiverId,
    required this.receiverName,
  });

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(getIt())
        ..getChatMessages(
            senderId: widget.senderId, receiverId: widget.receiverId),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          if (state is SendMessageSuccessState) {
            _scrollToBottom();
          }
        },
        builder: (context, state) {
          final cubit = context.read<ChatCubit>();
          final userMessages = cubit.chatDetailsModel?.messages
                  ?.where((message) => message.sender?.id == widget.senderId)
                  .toList() ??
              [];

          return Scaffold(
            appBar: appBar(
              context,
              automaticallyImplyLeading: false,
              isCenter: false,
              title: widget.receiverName,
              leading: Icon(Icons.arrow_back_ios, color: AppColor.yellowColor)
                  .onTap(context.pop),
              actions: [
                IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () {},
                  color: AppColor.yellowColor,
                ),
                IconButton(
                  icon: Icon(Icons.videocam),
                  onPressed: () {},
                  color: AppColor.yellowColor,
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    reverse: false,
                    itemCount: userMessages.length,
                    itemBuilder: (context, index) {
                      final message = userMessages[index];
                      return Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColor.yellowColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            message.message ?? "",
                            style: AppTextStyle.style16.copyWith(
                              color: AppColor.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Row(
                    children: [
                      IconButton(icon: Icon(Icons.add), onPressed: () {}),
                      Expanded(
                        child: TextField(
                          controller: cubit.messageController,
                          decoration: InputDecoration(
                            hintText: "Typeamessage".tr(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          cubit.sendMessage(
                            senderId: widget.senderId,
                            receiverId: widget.receiverId,
                            message: cubit.messageController.text,
                          );
                        },
                        color: AppColor.yellowColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
