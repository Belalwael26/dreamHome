import 'package:dream_home/Core/styles/app_text_style.dart';
import 'package:dream_home/Core/utils/app_images.dart';
import 'package:dream_home/app/routes/routes.dart';
import 'package:dream_home/core/widget/app_bar.dart';
import 'package:dream_home/core/widget/custom_loader.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/chat/presentation/cubit/chat_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/cache/user_info_cache.dart';
import '../../../../core/utils/app_color.dart';
import '../../../auth/data/model/Login/login_model/login_model.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  LoginModel? _user;

  @override
  void initState() {
    load();
    super.initState();
  }

  Future<void> load() async {
    LoginModel? user = await getUserFromSharedPreferences();
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChatCubit(getIt())..getAllChats(userid: _user!.user!.id.toString()),
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          final cubit = context.read<ChatCubit>();
          return Scaffold(
            appBar: appBar(context, title: "Chats".tr()),
            body: state is GetAllChatsLoadingState
                ? CustomLoader()
                : ListView.builder(
                    itemCount: cubit.chatModel?.chats?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: AppColor.yellowColor,
                            radius: 25,
                            backgroundImage: AssetImage(AppImages.craft2),
                          ),
                          title: Text(
                            cubit.chatModel?.chats?[index].user2?.email
                                    ?.split('@')
                                    .first ??
                                "",
                            style: TextStyle(fontSize: 16),
                          ),
                          subtitle: Text(
                            cubit.chatModel?.chats?[index].messages?[index]
                                    .message ??
                                "",
                            style: TextStyle(fontSize: 12),
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                DateFormat.Hm().format(
                                  DateTime.parse(cubit
                                          .chatModel?.chats?[index].createdAt
                                          .toString() ??
                                      ""),
                                ),
                                style: AppTextStyle.style16,
                              ),
                              SizedBox(height: 4),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: AppColor.green,
                                child: Visibility(
                                  visible: cubit.chatModel?.chats?[index]
                                          .messages?.length
                                          .toString()
                                          .isNotEmpty ??
                                      false,
                                  child: Text(
                                      cubit.chatModel?.chats?[index].messages
                                              ?.length
                                              .toString() ??
                                          "",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            context.push(Routes.chatDetails, extra: {
                              "senderId": cubit
                                  .chatModel?.chats?[index].user1?.id
                                  .toString(),
                              "receiverId": cubit
                                  .chatModel?.chats?[index].user2?.id
                                  .toString(),
                              "receiverName": cubit
                                  .chatModel?.chats?[index].user2?.email
                                  ?.split("@")
                                  .first
                            });
                          },
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
