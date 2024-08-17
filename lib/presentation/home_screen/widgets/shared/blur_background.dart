import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredBackground extends StatelessWidget {
  const BlurredBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: -2, sigmaY: -1), // Adjust blur effect
      child: Container(
        color: Colors.white.withOpacity(0.1),
      ),
    );
  }
}