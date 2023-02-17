import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';

class ContainerWidget extends StatelessWidget {
  final color, text, textColor;

  const ContainerWidget({
    super.key,
    this.color,
    this.text,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.width20,
        vertical: Dimensions.width20,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(28.0),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) => Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: constraints.maxHeight / 1.5,
                color: textColor,
                fontWeight: FontWeight.w900,
                fontFamily: 'Impact',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
