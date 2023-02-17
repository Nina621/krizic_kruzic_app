import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  TextInputType textInputType;
  List<TextInputFormatter>? textInputFormatter;
  Color? color;
  Color? fillColor;
  double? fontSize;
  bool? obscureText;
  Container? onActionIcons;

  TextFieldWidget(
      {Key? key,
      required this.controller,
      required this.text,
      this.textInputType = TextInputType.text,
      this.textInputFormatter,
      this.color = const Color(0xFFCCCCCC),
      this.fillColor = const Color(0xFF4C0099),
      this.fontSize = 22,
      this.obscureText = false,
      this.onActionIcons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.left,
      cursorColor: AppColors.placeholderColor,
      style: TextStyle(
        color: AppColors.whiteColor,
        fontSize: fontSize,
        fontFamily: "impact",
      ),
      obscureText: obscureText!,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: onActionIcons,
          filled: true,
          fillColor: fillColor,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          contentPadding: EdgeInsets.all(Dimensions.width20),
          labelText: text,
          labelStyle: TextStyle(
            fontFamily: "impact",
            fontSize: fontSize,
            color: color,
          )),
      keyboardType: textInputType,
      inputFormatters: textInputFormatter,
    );
  }
}
