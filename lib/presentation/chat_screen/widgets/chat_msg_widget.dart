import 'package:g_pay/core/g_pay_export.dart';
import 'package:g_pay/presentation/chat_screen/model/chat_model.dart';
import 'package:g_pay/presentation/chat_screen/model/msg_model.dart';
import 'package:g_pay/presentation/chat_screen/widgets/chat_msg_container.dart';

class ChatMessageWidget extends StatefulWidget {
  const ChatMessageWidget({
    super.key,
    required this.userData,
    required this.isMe,
    required this.data,
  });

  final ChatModel? userData;
  final bool isMe;
  final MessageModel data;

  @override
  ChatMessageWidgetState createState() => ChatMessageWidgetState();
}

class ChatMessageWidgetState extends State<ChatMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
      widget.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        MessageContainer(
          isMe: widget.isMe,
          userData: widget.userData,
          data: widget.data,
        ),
      ],
    );
  }
}