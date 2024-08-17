import 'package:flutter/material.dart';
import 'package:g_pay/presentation/chat_screen/model/chat_model.dart';
import 'package:g_pay/presentation/chat_screen/widgets/payment_info.dart';
import 'package:g_pay/theme/theme_helper.dart';
import 'package:nb_utils/nb_utils.dart';

class ChatUser extends StatelessWidget {
  final ChatModel? userData;

  const ChatUser({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment to ${userData?.name}',
            style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700)),
        10.height,
        Text('₹12,000',
            style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 24)),
        8.height,
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PaymentInfoRow(date: '24 Aug'),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 16,
            ),
          ],
        ),
      ],
    );
  }
}
