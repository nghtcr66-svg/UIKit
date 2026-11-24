import 'package:flutter/material.dart';
import 'package:nuikit/nuikit.dart';

class PickerWidget extends StatefulWidget {
  final String title;
  final bool hasLine;

  const PickerWidget({super.key, this.title = "FROM", required this.hasLine});

  @override
  State<PickerWidget> createState() => _PickerState();
}

class _PickerState extends State<PickerWidget> {
  String dateText = "MON, NOV 4,2019";

  // Список для перевода номера месяца в текст
  final months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC',
  ];
  final days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        // 1. Открываем стандартный календарь
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        // 2. Если дату выбрали — меняем текст
        if (date != null) {
          setState(() {
            dateText =
                "${days[date.weekday - 1]}, ${months[date.month - 1]} ${date.day},${date.year}";
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: widget.hasLine
                ? BorderSide(color: AppColors.Accent)
                : BorderSide.none,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.title.isNotEmpty)
              Text(
                widget.title,
                style: AppTypography.Caption2_Bold.copyWith(
                  color: AppColors.Accent,
                ),
              ),
            Padding(
              padding: EdgeInsets.only(top: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    dateText,
                    style: AppTypography.Caption_Regular.copyWith(fontSize: 14),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: SizedBox(
                      width: 8,
                      height: 4,
                      child: Image.asset('packages/nuikit/assets/icons/dd.png'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
