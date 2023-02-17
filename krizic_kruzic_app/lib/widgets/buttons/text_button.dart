import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';
import 'package:krizic_kruzic_app/widgets/text/big_text.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  Color color;

  TextButtonWidget(
      {Key? key,
      required this.text,
      this.onPressed,
      this.icon,
      this.color = const Color(0xFFFFFFFF)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: onPressed,
          child: Row(
            children: [
              Icon(icon,
                  size: icon != null ? Dimensions.iconSize24 : 0, color: color),
              BigTextWidget(
                text: text,
                color: color,
                size: Dimensions.font20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
