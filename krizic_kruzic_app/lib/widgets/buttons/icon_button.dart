import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';

class IconButtonWidget extends StatelessWidget {
  Color backgroundColor;
  Color iconColor;
  double size;
  BorderRadiusGeometry borderRadius;
  final IconData icon;
  final VoidCallback onPressed;

  IconButtonWidget({
    Key? key,
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.iconColor = const Color(0xFF9F01F4),
    required this.icon,
    required this.onPressed,
    this.size = 30,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(25.0),
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height60,
      width: Dimensions.width60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        child: Icon(
          icon,
          size: size,
          color: iconColor,
        ),
      ),
    );
  }
}
