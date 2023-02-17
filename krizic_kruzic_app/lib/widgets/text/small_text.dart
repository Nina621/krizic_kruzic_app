import 'package:flutter/material.dart';

class SmallTextWidget extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  String fontFamily;

  SmallTextWidget(
      {Key? key,
      this.color = const Color(0xFFFFFFFF),
      required this.text,
      this.size = 20,
      this.height = 1.2,
      this.fontFamily = 'Nunito'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        color: color,
        fontSize: size,
        height: height,
      ),
    );
  }
}
