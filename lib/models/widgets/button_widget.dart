import 'package:flutter/material.dart';
import 'package:nuikit/nuikit.dart';

class ButtonWidget extends StatelessWidget {
  final double widht;
  final double height;
  final String text;
  final VoidCallback onTap;

  const ButtonWidget({
    super.key,
    required this.widht,
    required this.height,
    required this.text,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widht,
      height: height,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.Accent,
          ),
          onPressed: onTap,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: AppTypography.TittlePoppins.copyWith(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.White),
            ),
          )
      ),
    );
  }
}
