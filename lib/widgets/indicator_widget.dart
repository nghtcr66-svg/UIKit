import 'package:flutter/material.dart';
import 'package:nuikit/nuikit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IndicatorWidget extends StatelessWidget {
  final Color acttive_color;
  final Color dot_color;
  final PageController controller;
  const IndicatorWidget({
    super.key,
    required this.acttive_color,
    required this.dot_color,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: SlideEffect(
        dotColor: AppColors.Accent_inactive,
        activeDotColor: AppColors.Accent,
      ),
    );
  }
}
