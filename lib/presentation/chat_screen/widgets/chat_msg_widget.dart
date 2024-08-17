import 'package:g_pay/core/g_pay_export.dart';
import 'package:g_pay/core/utils/g_pay_colors.dart';
import 'package:g_pay/presentation/chat_screen/model/msg_model.dart';

class ChatMessageWidget extends StatefulWidget {
  const ChatMessageWidget({
    super.key,
    required this.isMe,
    required this.data,
  });

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
        _buildMessageContainer(context),
      ],
    );
  }

  Widget _buildMessageContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      margin: widget.isMe
          ? EdgeInsets.only(
              top: 3.0, bottom: 3.0, left: (context.width() * 0.25).toDouble())
          : EdgeInsets.only(
              top: 4.0,
              bottom: 4.0,
              right: (context.width() * 0.25).toDouble()),
      decoration: BoxDecoration(
        color: widget.isMe ? Colors.white : Colors.grey[200],
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
            color: widget.isMe ? Colors.grey[300]! : Colors.transparent),
      ),
      child: _buildMessageText(),
    );
  }

  Widget _buildMessageText() {
    return Text(
      widget.data.msg!,
      style: primaryTextStyle(
        color: widget.isMe ? GPayColors.gpColorBlack : GPayColors.gpColorBlack,
      ),
    );
  }
}
