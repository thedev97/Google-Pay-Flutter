import 'package:g_pay/core/g_pay_export.dart';
import 'package:g_pay/presentation/chat_screen/model/chat_model.dart';
import 'package:g_pay/presentation/chat_screen/model/msg_model.dart';
import 'package:g_pay/presentation/chat_screen/widgets/chat_me.dart';
import 'package:g_pay/presentation/chat_screen/widgets/chat_user.dart';
import 'package:g_pay/presentation/home_screen/widgets/shared/blur_background.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({
    super.key,
    required this.isMe,
    required this.userData,
    required this.data,
  });

  final bool isMe;
  final ChatModel? userData;
  final MessageModel data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BlurredBackground(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          margin: isMe
              ? EdgeInsets.only(
              top: 3.0, bottom: 3.0, left: (context.width() * 0.25).toDouble())
              : EdgeInsets.only(
              top: 4.0,
              bottom: 4.0,
              right: (context.width() * 0.25).toDouble()),
          decoration: BoxDecoration(
            color: isMe ? Colors.black : Colors.black,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(2, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white70),
          ),
          child: isMe ? const ChatMe() :  ChatUser(userData: userData),
        )
      ],
    );
  }
}
