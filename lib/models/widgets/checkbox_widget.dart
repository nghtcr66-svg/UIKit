import 'package:flutter/material.dart';
import 'package:nuikit/nuikit.dart';

class CheckboxWidget extends StatefulWidget {
  final double padding;
  final String text;

  const CheckboxWidget({super.key, required this.padding, required this.text});

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          // Рамка в обоих состояниях (активном и неактивном)
          side: WidgetStateBorderSide.resolveWith(
            (states) => const BorderSide(
              color: AppColors.Accent, // Розово-малиновый оттенок
              width: 1.8,
            ),
          ),
          // Делаем фон чекбокса прозрачным
          fillColor: WidgetStateProperty.all(Colors.transparent),
          checkColor: AppColors.Accent,
          value: _isActive,
          onChanged: (bool? newValue) {
            setState(() {
              _isActive = newValue ?? false;
            });
          },
        ),
        Padding(
          padding: EdgeInsets.only(left: widget.padding),
          child: Text(widget.text, style: AppTypography.Caption2_Regular),
        ),
      ],
    );
  }
}
