import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nuikit/nuikit.dart';

class CustomtimerWidget extends StatefulWidget {
  final double widht;
  final double height;

  const CustomtimerWidget({
    super.key,
    required this.widht,
    required this.height,
  });

  @override
  State<CustomtimerWidget> createState() => _CustomtimerWidgetState();
}

class _CustomtimerWidgetState extends State<CustomtimerWidget> {
  Timer? _timer;
  int _seconds = 0;

  @override
  void initState() {
    super.initState();
    // Автоматический запуск при создании/обновлении виджета
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  @override
  void dispose() {
    // Обязательно останавливаем таймер при уходе со страницы, чтобы не было утечек памяти
    _timer?.cancel();
    super.dispose();
  }

  // Форматирование секунд в вид 00:00
  String _formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.widht,
      height: widget.height,
      decoration: BoxDecoration(
        color: AppColors.Accent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              'Timer',
              style: AppTypography.Title2_Regular.copyWith(
                color: AppColors.White,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              _formatTime(_seconds),
              style: AppTypography.TittlePoppins.copyWith(
                color: Colors.white,
                fontSize: 24,
                // Делает ширину всех цифр одинаковой, чтобы текст не дергался при смене секунд
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
