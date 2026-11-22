import 'package:flutter/material.dart';
import 'package:nuikit/api/api_client.dart';
import 'package:nuikit/models/register_request_model.dart';
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
import 'package:dio/dio.dart';
import 'package:dio/browser.dart';
import 'package:nuikit/models/publish_game_request_model.dart';

void request_func() async {
  final dio = Dio();
  // Эта одна строчка напечатает в консоль весь запрос, заголовки и ответ сервера!
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  try {
    final api = ApiClient(dio);
    const token = '4OWiuS9F-626KO4wXDH2QBn6VWU7bhgRvN49QLJn4KQ';

    final response = await api.getMyStatistic('Bearer $token');
    print('Успех: $response');
  } catch (e) {
    print('Ошибка: $e');
  }
}

void post_func() async {
  final dio = Dio();
  // Эта одна строчка напечатает в консоль весь запрос, заголовки и ответ сервера!
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  try {
    final api = ApiClient(dio);
    const token = '4OWiuS9F-626KO4wXDH2QBn6VWU7bhgRvN49QLJn4KQ';

    final response = await api.publishGame(
      'Bearer $token',
      PublishGameRequestModel(
        category: 'image',
        description: 'desc',
        endsAt: DateTime.now()
            .add(const Duration(days: 2))
            .toUtc()
            .toIso8601String(),
        name: 'Alehacartoha',
        reminderEnabled: false,
        startsAt: DateTime.now()
            .add(const Duration(days: 1))
            .toUtc()
            .toIso8601String(),
        winningPoints: 300,
      ),
    );
    print('Успех: $response');
  } catch (e) {
    print('Ошибка: $e');
  }
}

void register_func() async {
  final dio = Dio();
  // Эта одна строчка напечатает в консоль весь запрос, заголовки и ответ сервера!
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  try {
    final api = ApiClient(dio);
    const token = '4OWiuS9F-626KO4wXDH2QBn6VWU7bhgRvN49QLJn4KQ';

    final response = await api.registerME(
      'Bearer $token',
      RegisterRequestModel(
        email: "test@test.ru",
        fullName: "test",
        password: "12345678",
        phone: "+71111111111",
        username: "test",
      ),
    );
    print('Успех: $response');
  } catch (e) {
    print('Ошибка: $e');
  }
}

void getInfo_func() async {
  final dio = Dio();
  // Эта одна строчка напечатает в консоль весь запрос, заголовки и ответ сервера!
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  try {
    final api = ApiClient(dio);
    const token = 'y79RLpsBDEgwgqUJtawimBWloyhZoOqt6rQF1ZRW8fE';

    final response = await api.getUserInfo('Bearer $token', 1);
    print('Успех: $response');
  } catch (e) {
    print('Ошибка: $e');
  }
}

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
              constraints: const BoxConstraints(maxWidth: 400, maxHeight: 700),
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
            return ButtonWidget(
              widht: 315,
              height: 58,
              text: "Lets Combat",
              onTap: getInfo_func,
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
              obscureText: true,
            );
          },
        ),
        Story(
          name: "Timer Widget",
          builder: (context) {
            return CustomtimerWidget(widht: 295, height: 99);
          },
        ),
        Story(
          name: "Select",
          builder: (context) {
            return PickerWidget(hasLine: true);
          },
        ),
      ],
    );
  }
}
