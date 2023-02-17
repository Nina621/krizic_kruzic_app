import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';

class FloatingButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const FloatingButtonWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: Dimensions.height10,
        bottom: Dimensions.height60,
      ),
      child: Transform.scale(
        scale: 1,
        child: FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: AppColors.whiteColor,
          child: const Icon(
            Icons.add,
            color: AppColors.secondaryMainColor,
          ),
        ),
      ),
    );
  }
}
