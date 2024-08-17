import 'package:flutter/material.dart';
import 'package:g_pay/data/data_provider.dart';
import 'package:g_pay/core/utils/g_pay_colors.dart';
import 'package:g_pay/presentation/chat_screen/model/msg_model.dart';
import 'package:g_pay/presentation/chat_screen/widgets/chat_msg_widget.dart';
import 'package:nb_utils/nb_utils.dart';

class ChatWidget extends StatefulWidget {
  final String? personName;

  const ChatWidget({super.key, this.personName});

  @override
  ChatWidgetState createState() => ChatWidgetState();
}

class ChatWidgetState extends State<ChatWidget> {
  final ScrollController scrollController = ScrollController();
  final TextEditingController msgController = TextEditingController();
  final FocusNode msgFocusNode = FocusNode();

  List<MessageModel> msgListing = getChatMsgData();
  bool isTabSelected = true;
  String? msg;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  void sendMessage() async {
    if (msgController.text.trim().isNotEmpty) {
      _addMessage(msgController.text, senderId);
      msgController.clear();
      _scrollToTop();
      FocusScope.of(context).requestFocus(msgFocusNode);

      await Future.delayed(const Duration(seconds: 1));
      _addMessage(msgController.text, receiverId);
      _scrollToTop();
    } else {
      FocusScope.of(context).requestFocus(msgFocusNode);
    }

    setState(() {});
  }

  void _addMessage(String text, int sender) {
    var msgModel = MessageModel()
      ..msg = text
      ..senderId = sender;

    msgListing.insert(0, msgModel);
  }

  void _scrollToTop() {
    if (mounted) scrollController.animToTop();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildMessageList(),
        _buildChatTextField(),
      ],
    );
  }

  Widget _buildMessageList() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      decoration: const BoxDecoration(color: Colors.white),
      child: ListView.separated(
        separatorBuilder: (_, i) => const Divider(color: Colors.transparent),
        shrinkWrap: true,
        reverse: true,
        controller: scrollController,
        itemCount: msgListing.length,
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 70),
        itemBuilder: (_, index) {
          MessageModel data = msgListing[index];
          bool isMe = data.senderId == senderId;

          return ChatMessageWidget(isMe: isMe, data: data);
        },
      ),
    );
  }

  Widget _buildChatTextField() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: defaultBoxShadow(),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildPayButton(),
            8.width,
            _buildRequestButton(),
            _buildToggleTabButton(),
            16.width,
            _buildMessageInputField(),
          ],
        ),
      ),
    );
  }

  Widget _buildPayButton() {
    return Container(
      margin: const EdgeInsets.only(left: 100),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: const BoxDecoration(
        color: GPayColors.gpAppColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        "Pay",
        style: secondaryTextStyle(
          size: 12,
          color: GPayColors.gpColorBlack,
          weight: FontWeight.bold,
        ),
      ),
    ).visible(isTabSelected).onTap(() {
      //const GPPayComponent().launch(context);
    });
  }

  Widget _buildRequestButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: const BoxDecoration(
        color: GPayColors.gpColorBlack,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        "Request",
        style: secondaryTextStyle(
          size: 12,
          color: GPayColors.gpColorBlack,
          weight: FontWeight.bold,
        ),
      ),
    ).visible(isTabSelected);
  }

  Widget _buildToggleTabButton() {
    return CircleAvatar(
      backgroundColor: Colors.blue,
      radius: 16,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: const Icon(Icons.navigate_next_outlined),
        color: Colors.white,
        onPressed: () {
          setState(() {
            isTabSelected = true;
            hideKeyboard(context);
          });
        },
      ),
    ).onTap(() {}).visible(!isTabSelected);
  }

  Widget _buildMessageInputField() {
    return TextField(
      controller: msgController,
      focusNode: msgFocusNode,
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        filled: true,
        suffixIcon: const Icon(Icons.navigate_next_outlined,
                color: GPayColors.gpColorBlack, size: 40)
            .visible(!isTabSelected),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        hintText: widget.personName != null
            ? 'Write to ${widget.personName}'
            : 'Type message',
        hintStyle: primaryTextStyle(size: 14, color: Colors.grey),
      ),
      style: primaryTextStyle(),
      onSubmitted: (_) => sendMessage(),
      onTap: () {
        isTabSelected = false;
        setState(() {});
      },
    ).expand();
  }
}
