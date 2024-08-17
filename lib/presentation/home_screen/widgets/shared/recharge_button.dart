import 'package:flutter/material.dart';

class RechargeButton extends StatelessWidget {
  const RechargeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 35,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 2),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: const CircleBorder(),
            padding: EdgeInsets.zero,
          ),
          child: const Icon(Icons.arrow_forward, color: Colors.white),
        ),
      ),
    );
  }
}