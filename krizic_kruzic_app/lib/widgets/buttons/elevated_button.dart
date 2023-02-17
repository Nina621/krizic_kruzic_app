import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';
import 'package:krizic_kruzic_app/widgets/text/big_text.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onPressed;
  Color? color;
  Size? fillSize;

  ElevatedButtonWidget(
      {Key? key,
      required this.text,
      required this.backgroundColor,
      required this.onPressed,
      this.color = const Color(0xFF9F01F4),
      this.fillSize = const Size(330, 60)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        fixedSize: fillSize,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius20)),
      ),
      child: BigTextWidget(text: text, color: color, size: Dimensions.font30),
    );
  }
}
