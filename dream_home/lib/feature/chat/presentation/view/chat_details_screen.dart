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

class ChatDetailsScreen extends StatelessWidget {
  final String senderId;
  final String receiverId;
  final String receiverName;
  const ChatDetailsScreen(
      {super.key,
      required this.senderId,
      required this.receiverId,
      required this.receiverName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(getIt())
        ..getChatMessages(senderId: senderId, receiverId: receiverId),
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          final cubit = context.read<ChatCubit>();
          return Scaffold(
            appBar: appBar(context,
                automaticallyImplyLeading: false,
                isCenter: false,
                title: receiverName,
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
                ]),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    itemCount: cubit.chatDetailsModel?.messages?.length ?? 0,
                    itemBuilder: (context, index) {
                      final isMe = index % 2 == 0;
                      return Align(
                        alignment:
                            isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color:
                                isMe ? AppColor.yellowColor : Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            cubit.chatDetailsModel?.messages?[index].message ??
                                "",
                            style: AppTextStyle.style16.copyWith(
                              color: isMe ? AppColor.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(icon: Icon(Icons.add), onPressed: () {}),
                      Expanded(
                        child: TextField(
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
                        onPressed: () {},
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
