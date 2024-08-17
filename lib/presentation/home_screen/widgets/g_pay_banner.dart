import 'package:flutter/material.dart';
import 'package:g_pay/core/utils/g_pay_image_constant.dart';
import 'package:g_pay/presentation/home_screen/widgets/shared/blur_background.dart';
import 'package:g_pay/presentation/home_screen/widgets/shared/recharge_button.dart';

class GPayBanner extends StatelessWidget {
  const GPayBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 160,
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            GPayImageConstant.gpBannerBg,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 160,
          ),
          const BlurredBackground(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Fast & free data top-ups',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'No extra fees for recharges\nbelow ₹100',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      'Recharge Now',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const RechargeButton(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
