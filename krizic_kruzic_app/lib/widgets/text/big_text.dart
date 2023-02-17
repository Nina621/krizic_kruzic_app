import 'package:flutter/cupertino.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';

class BigTextWidget extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  int maxLine;

  BigTextWidget({
    Key? key,
    this.color = const Color(0xFFFFFFFF),
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size = 0,
    this.maxLine = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      maxLines: maxLine,
      overflow: overflow,
      style: TextStyle(
          fontFamily: 'impact',
          color: color,
          fontSize: size == 0 ? Dimensions.font42 : size,
          fontWeight: FontWeight.w400),
    );
  }
}
