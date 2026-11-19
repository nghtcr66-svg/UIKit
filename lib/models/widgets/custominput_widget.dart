import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../nuikit.dart';

class CustominputWidget extends StatefulWidget {

  //Принимаем прям усе что только можно прикол в том что доп функции всегда есть но по-умолчанию не юзаем
  final String text_hint;
  final TextEditingController controller;
  final String? errorMess;
  //нужны для phonefield
  final int? maxLenght;
  final List<TextInputFormatter>? inputFormater;
  //нужны для passwordfield
  final TextInputType inputType;
  final Widget? suffixIcon;
  final bool obscureText;


  const CustominputWidget({
    super.key,
    required this.text_hint,
    this.inputType = TextInputType.text,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.errorMess,
    this.inputFormater,
    this.maxLenght,
  });

  @override
  State<CustominputWidget> createState() => _CustominputWidgetState();
}

class _CustominputWidgetState extends State<CustominputWidget> {
  late bool _hide;

  @override
  void initState() {
    _hide = widget.obscureText;
  }





  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: widget.text_hint,
        errorText: widget.errorMess,
        suffixIcon: widget.obscureText
            ? IconButton(onPressed: () => setState(() => _hide = !_hide),
            icon: Icon(
              _hide ? Icons.visibility_off : Icons.visibility,
              color: AppColors.Black,
            ),
        ): widget.suffixIcon,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.Accent_inactive),
        ),
        counterText: '', //спрятали счетчик я хз почему он появляется мне так Claude code сказал
        focusedBorder: UnderlineInputBorder(   // линия, когда нажал на поле
          borderSide: BorderSide(color: AppColors.Accent, width: 2),
        ),
      ),
      keyboardType: widget.inputType,
      controller: widget.controller,
      obscureText: _hide,
      inputFormatters: widget.inputFormater,
      maxLength: widget.maxLenght,
    );
  }
}
