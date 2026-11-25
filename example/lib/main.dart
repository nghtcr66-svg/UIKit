import 'package:flutter/material.dart';
import 'package:nuikit/widgets/avatar_widget.dart';
import 'package:nuikit/widgets/button_widget.dart';
import 'package:nuikit/widgets/indicator_widget.dart';
import 'package:nuikit/widgets/landing_container_widget.dart';
import 'package:nuikit/nuikit.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:nuikit/widgets/checkbox_widget.dart';
import 'package:nuikit/widgets/custominput_widget.dart';
import 'package:nuikit/widgets/customtimer_widget.dart';
import 'package:nuikit/widgets/picker_widget.dart';
import 'package:api_lib/api_lib.dart';

void main() {
  runApp(const MyStorybookApp());
}

class MyStorybookApp extends StatelessWidget {
  const MyStorybookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(
      // Используем Material вместо второго MaterialApp, чтобы не ломался _RenderTheater
      wrapperBuilder: (context, child) => Material(
        color: Colors.white,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400, maxHeight: 700),
            child: child,
          ),
        ),
      ),
      stories: [
        Story(
          name: 'Landing Widget',
          builder: (context) {
            return LandingcontainerWidget(
              height: 200,
              wight: 315,
              text_title: "XXX",
              text_desc: "xxx",
              image_path: "packages/nuikit/assets/images/9.png",
              func: () {},
              arrow_padding: 40,
            );
          },
        ),
        Story(
          name: "Page Indicator",
          builder: (context) {
            return IndicatorWidget(
              acttive_color: AppColors.Accent_inactive,
              dot_color: AppColors.Accent,
              controller: PageController(),
            );
          },
        ),
        Story(
          name: "Button Widget",
          builder: (context) {
            return Center(
              child: ButtonWidget(
                widht: 315,
                height: 58,
                text: "Lets Combat",
                // Делаем колбэк асинхронным и вызываем функцию со скобками ()
                onTap: () async {
                  final myData = await joingame_func(true);
                  print('Ответ от сервера: ${myData.category}');
                },
              ),
            );
          },
        ),
        Story(
          name: "Checkbox Widget",
          builder: (context) {
            return CheckboxWidget(padding: 20, text: "");
          },
        ),
        Story(
          name: "Input",
          builder: (context) {
            return CustominputWidget(
              text_hint: "Hint text",
              controller: TextEditingController(),
            );
          },
        ),
        Story(
          name: "Input2",
          builder: (context) {
            return CustominputWidget(
              text_hint: "Password",
              controller: TextEditingController(),
              obscureText: true, // Используем параметр из прошлого шага вместо obscureText
            );
          },
        ),
        Story(
          name: "Timer Widget",
          builder: (context) {
            return const Center(
              child: CustomtimerWidget(widht: 295, height: 99),
            );
          },
        ),
        Story(
          name: "Select",
          builder: (context) {
            return const Center(
              child: PickerWidget(hasLine: true),
            );
          },
        ),
        Story(
          name: "AVA",
          builder: (context) {
            return Center(
              child: AvatarWidget(
                wight: 56,
                height: 56,
                onTap: (){},
                dec: Border.all() 
                ),
            );
          },
        ),
      ],
    );
  }
}
