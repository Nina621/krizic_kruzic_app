import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/constants/constants.dart';
import 'package:krizic_kruzic_app/model/game/ui_logic.dart';
import 'package:krizic_kruzic_app/routes/route_helper.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';
import 'package:krizic_kruzic_app/widgets/profileContainerRow.dart';
import 'package:krizic_kruzic_app/widgets/reusable_button.dart';

import 'game_screen.dart';

class ResultScreen extends StatelessWidget {
  final winningLetter, onTap;

  const ResultScreen({
    super.key,
    this.winningLetter,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryMainColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: Dimensions.height15),
              child: EntireRowInGameScreen(),
            ),
            Expanded(
              child: DelayedDisplay(
                delay: const Duration(milliseconds: 500),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.secondaryMainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              height: constraints.maxHeight * 0.60,
                              image: AssetImage(
                                  'assets/images/${UILogic.finalResult}.png'),
                            ),
                            SizedBox(
                              height: Dimensions.height15,
                            ),
                            UILogic.finalResult == "Win"
                                ? Center(
                                    child: Text(
                                      "${UILogic.playerMap[winningLetter]} Wins",
                                      style: AppConstants.resultText.copyWith(
                                          fontSize:
                                              constraints.maxHeight / 10.5),
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      "Drawn",
                                      style: AppConstants.resultText.copyWith(
                                          fontSize:
                                              constraints.maxHeight / 10.5),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            DelayedDisplay(
              delay: const Duration(milliseconds: 850),
              child: Padding(
                padding: EdgeInsets.only(top: Dimensions.height10),
                child: Column(
                  children: [
                    ReusableButton(text: 'Play again', onTap: onTap),
                    ReusableButton(
                      text: 'Home',
                      onTap: () {
                        ui.setAllVars();
                        UILogic.muteSound = true;
                        Get.offNamed(RouteHelper.getDashboardScreen());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
