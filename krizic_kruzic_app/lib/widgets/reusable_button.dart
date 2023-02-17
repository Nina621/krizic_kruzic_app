import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';

class ReusableButton extends StatelessWidget {
  final onTap, text;

  const ReusableButton({
    super.key,
    this.onTap,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: Dimensions.height15),
        textColor: AppColors.activeColor,
        color: AppColors.whiteColor,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius20)),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'Impact',
              fontSize: Dimensions.font25,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
