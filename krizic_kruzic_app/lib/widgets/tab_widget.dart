import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/widgets/text/big_text.dart';

class TabWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  double height;
  final Color tabColor;
  final Color textColor;
  double fontSize;

  TabWidget({
    Key? key,
    required this.text,
    required this.onTap,
    this.height = 60,
    this.fontSize = 24,
    required this.tabColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          color: tabColor,
          alignment: FractionalOffset.center,
          child: BigTextWidget(
            text: text,
            color: textColor,
            size: fontSize,
          ),
        ),
      ),
    );
  }
}
