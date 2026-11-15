import 'package:flutter/material.dart';
import 'package:nuikit/nuikit.dart';


class TimerWidget extends StatelessWidget {

  final double widht;
  final double height;



  const TimerWidget({
    super.key,
    required this.widht,
    required this.height
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: AppColors.Accent
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Text(
              'Timer',
              style: AppTypography.MainPoppins.copyWith(
                color: AppColors.White,
                letterSpacing: 0.3,
                fontSize: 12
              )
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(top: 14),
            child: Text(
              "00:00",
              style: AppTypography.TittlePoppins.copyWith(
                color: AppColors.White,
                fontSize: 30,
                letterSpacing: 0.3
              ),
            ),

          )
        ],
      ),
    );
  }
}
























