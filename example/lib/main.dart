import 'package:flutter/material.dart';
import 'package:nuikit/models/widgets/button_widget.dart';
import 'package:nuikit/models/widgets/indicator_widget.dart';
import 'package:nuikit/models/widgets/landing_container_widget.dart';
import 'package:nuikit/models/widgets/timer_widget.dart';
import 'package:nuikit/nuikit.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:nuikit/models/widgets/checkbox_widget.dart';
import 'package:nuikit/models/widgets/custominput_widget.dart';
import 'package:nuikit/models/widgets/customtimer_widget.dart';
import 'package:nuikit/models/widgets/picker_widget.dart';




void main() {
  runApp(const MyStorybookApp());
}

class MyStorybookApp extends StatelessWidget {
  const MyStorybookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(
      // Эта обертка чинит ошибку с _RenderTheater и размерами
      wrapperBuilder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            // Ограничиваем размеры, чтобы любой виджет влез и не сломался
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 400,
                maxHeight: 700,
              ),
              child: child,
            ),
          ),
        ),
      ),
      stories: [

        // --- ИСТОРИЯ 2: Сюда вставь свой виджет ---
        Story(
          name: 'Landing Widget',
          builder: (context) {
            // Замени Container на свой виджет!
            return LandingcontainerWidget(
                height: 200,
                wight: 315,
                text_title: "XXX",
                text_desc: "xxx",
                image_path: "packages/nuikit/assets/images/9.png",
                func: (){},
                arrow_padding: 40
            );
          },
        ),
        Story(
            name: "Page Indicator",
            builder: (context){
              return IndicatorWidget(
                  acttive_color: AppColors.Accent_inactive,
                  dot_color: AppColors.Accent,
                  controller: PageController()
              );
            }
        ),
        Story(
            name: "Button Widget",
            builder: (context){
              return ButtonWidget(
                  widht: 315,
                  height: 58,
                  text: "Lets Combat",
                  onTap: (){}
              );
            }
        ),
        Story(
            name: "Checkbox Widget",
            builder: (context){
              return CheckboxWidget(
                  padding: 20,
                  text: ""
              );
            }
        ),
        Story(
            name: "Input",
            builder: (context){
              return CustominputWidget(
                  text_hint: "Hint text",
                  controller: TextEditingController()
              );
            }
        ),
        Story(
            name: "Input2",
            builder: (context){
              return CustominputWidget(
                  text_hint: "Password",
                  controller: TextEditingController(),
                  obscureText: true,
              );
            }
        ),
        Story(
            name: "Timer Widget",
            builder: (context){
              return CustomtimerWidget(
                  widht: 295,
                  height: 99
              );
            }
        ),
        Story(
            name: "Select",
            builder: (context){
              return PickerWidget(
                hasLine: true,
              );
            }
        ),
      ],
    );
  }
}
