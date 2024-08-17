import 'package:flutter/material.dart';
import 'package:g_pay/presentation/chat_screen/model/chat_model.dart';
import 'package:g_pay/presentation/chat_screen/model/contact_model.dart';
import 'package:g_pay/presentation/chat_screen/widgets/appbar/chat_app_bar.dart';
import 'package:g_pay/presentation/chat_screen/widgets/chat_widget.dart';

class ChatScreen extends StatefulWidget {
  final ChatModel userData;
  final ContactModel? chatData;
  final String? screenName;

  const ChatScreen({
    super.key,
    required this.userData,
    this.chatData,
    this.screenName,
  });

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  late String contactUser = '';
  late String contactPhone = '';
  late String contactImg = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    if (widget.screenName == "ContactList" && widget.chatData != null) {
      contactUser = widget.chatData!.userName ?? '';
      contactPhone = widget.chatData!.userPhoneNumber ?? '';
      contactImg = widget.chatData!.userImg ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ChatAppBar(
          screenName: widget.screenName,
          userData: widget.userData,
          contactUser: contactUser,
          contactPhone: contactPhone,
          personImg: contactImg,
        ),
        body: ChatWidget(userData: widget.userData),
      ),
    );
  }
}
