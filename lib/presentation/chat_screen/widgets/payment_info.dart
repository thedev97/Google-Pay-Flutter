import 'package:flutter/material.dart';
import 'package:g_pay/theme/theme_helper.dart';
import 'package:nb_utils/nb_utils.dart';

class PaymentInfoRow extends StatelessWidget {
  const PaymentInfoRow({
    super.key,
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.check_circle_rounded,
          color: Colors.green,
          size: 16,
        ),
        8.width,
        Text('Paid',
            style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w400)),
        2.width,
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(' • ',
              style: theme.textTheme.titleSmall?.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w800)),
        ),
        2.width,
        Text(date,
            style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w400)),
      ],
    );
  }
}