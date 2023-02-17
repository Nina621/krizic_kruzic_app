import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';


class CustomContainer extends StatelessWidget {
  final double height;
  final Widget child;

  const CustomContainer({
    Key? key,
    required this.height,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimensions.width10,
          right: Dimensions.width10,
          bottom: Dimensions.height10),
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20)),
          color: AppColors.secondaryMainColor,
          border: Border.all(color: AppColors.whiteColor, width: 2)),
      child: child,
    );
  }
}
