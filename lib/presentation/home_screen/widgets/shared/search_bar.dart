import 'package:flutter/material.dart';
import 'package:g_pay/core/utils/g_pay_colors.dart';
import 'package:g_pay/theme/theme_helper.dart';

class GPaySearchBar extends StatelessWidget {
  final String hintText;

  const GPaySearchBar({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Colors.white24,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
          BoxShadow(
            color: Colors.white12,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon:
          const Icon(Icons.search, color: GPayColors.gpColorBlack),
          hintText: hintText,
          hintStyle: theme.textTheme.displaySmall?.copyWith(
            color: GPayColors.gpColorBlack
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
