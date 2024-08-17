import 'package:flutter/material.dart';
import 'package:g_pay/presentation/chat_screen/widgets/payment_info.dart';
import 'package:g_pay/theme/theme_helper.dart';
import 'package:nb_utils/nb_utils.dart';

class ChatMe extends StatelessWidget {
  const ChatMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment to You',
            style: theme.textTheme.titleMedium
                ?.copyWith(color: Colors.white, fontSize: 16)),
        10.height,
        Text('₹5,000',
            style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 24)),
        8.height,
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PaymentInfoRow(date: '22 Aug'),
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
