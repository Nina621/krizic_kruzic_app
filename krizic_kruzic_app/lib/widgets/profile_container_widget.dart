import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/constants/constants.dart';
import 'package:krizic_kruzic_app/model/game/ui_logic.dart';

class ProfileContainer extends StatelessWidget {
  final profileName, letter, imageName;

  const ProfileContainer({
    super.key,
    this.profileName,
    this.letter,
    this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: UILogic.finalResult == ""
          ? BoxDecoration(
              color: UILogic.letterO
                  ? letter == "O"
                      ? AppColors.activeColor
                      : AppColors.profileContainerColor
                  : letter == "X"
                      ? AppColors.activeColor
                      : AppColors.profileContainerColor,
              borderRadius: BorderRadius.circular(15.0),
              border: UILogic.letterO
                  ? letter == "O"
                      ? Border.all(color: Colors.white, width: 1.0)
                      : Border.all(
                          color: AppColors.secondaryMainColor, width: 1.5)
                  : letter == "X"
                      ? Border.all(color: Colors.white, width: 1.0)
                      : Border.all(
                          color: AppColors.secondaryMainColor, width: 1.5))
          : UILogic.finalResult != "Win"
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: AppColors.profileContainerColor,
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: UILogic.letterX == false
                      ? letter == "X"
                          ? AppColors.activeColor
                          : AppColors.profileContainerColor
                      : letter == "O"
                          ? AppColors.activeColor
                          : AppColors.profileContainerColor,
                  border: UILogic.letterX == false
                      ? letter == "X"
                          ? Border.all(color: Colors.white, width: 1.0)
                          : Border.all(
                              color: AppColors.secondaryMainColor, width: 1.5)
                      : letter == "O"
                          ? Border.all(color: Colors.white, width: 1.0)
                          : Border.all(
                              color: AppColors.secondaryMainColor, width: 1.5)),
      width: 135.0,
      height: 150.0,
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage("assets/images/$imageName.png"),
              height: constraints.maxHeight * 0.30,
            ),
            Text(
              profileName,
              style: TextStyle(
                fontSize: constraints.maxHeight * 0.12,
                color: Colors.white,
                fontFamily: 'Impact',
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  letter,
                  style: TextStyle(
                    fontSize: constraints.maxHeight * 0.20,
                    fontFamily: 'Impact',
                    color: letter == "X"
                        ? AppConstants.letterXColor
                        : AppConstants.letterOColor,
                  ),
                ),
                Text(
                  ":",
                  style: TextStyle(
                    fontFamily: 'Impact',
                    fontSize: constraints.maxHeight * 0.15,
                    color: letter == "X"
                        ? AppConstants.letterXColor
                        : AppConstants.letterOColor,
                  ),
                ),
                Text(
                  letter == "X"
                      ? UILogic.xWins.toString()
                      : UILogic.oWins.toString(),
                  style: TextStyle(
                    fontSize: constraints.maxHeight * 0.20,
                    fontFamily: 'Impact',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
