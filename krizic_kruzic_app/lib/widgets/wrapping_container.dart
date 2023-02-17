import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/constants/constants.dart';
import 'package:krizic_kruzic_app/model/game/ui_logic.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';

class WrappingContainer extends StatelessWidget {
  final onTap, containerNo;
  String letter = "";

  WrappingContainer({
    super.key,
    this.onTap,
    required this.letter,
    this.containerNo,
  });

  @override
  Widget build(BuildContext context) {
    UILogic.containerWidth = MediaQuery.of(context).size.width - 40;

    UILogic.bw = UILogic.containerWidth / 3;

    UILogic.wpWidth = UILogic.bw - 16;
    UILogic.wpHeight = UILogic.bw - 16;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: UILogic.finalResult != "Win"
              ? BoxDecoration(
                  color: AppColors.profileContainerColor,
                  borderRadius: BorderRadius.circular(10.0),
                )
              : BoxDecoration(
                  color: UILogic.colorMap[containerNo] == AppConstants.kG
                      ? Colors.lightGreen
                      : AppColors.profileContainerColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
          height: UILogic.wpHeight,
          width: UILogic.wpWidth,
          child: Padding(
            padding: EdgeInsets.only(top: Dimensions.height20),
            child: Text(
              UILogic.chars[containerNo] == ""
                  ? letter
                  : UILogic.chars[containerNo],
              style: UILogic.finalResult != "Win"
                  ? TextStyle(
                      fontFamily: UILogic.chars[containerNo] == "X"
                          ? 'Impact'
                          : "Impact",
                      fontSize: Dimensions.font40,
                      color: UILogic.chars[containerNo] == "X"
                          ? AppConstants.letterXColor
                          : AppConstants.letterOColor,
                    )
                  : TextStyle(
                      fontFamily: UILogic.chars[containerNo] == "X"
                          ? 'Impact'
                          : "Impact",
                      fontSize: Dimensions.font40,
                      color: UILogic.colorMap[containerNo] == AppConstants.kG
                          ? Colors.white
                          : UILogic.chars[containerNo] == "X"
                              ? AppConstants.letterXColor
                              : AppConstants.letterOColor,
                    ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
