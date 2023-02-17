import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/constants/constants.dart';
import 'package:krizic_kruzic_app/model/game/ui_logic.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';

import 'profile_container_widget.dart';

class EntireRowInGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ProfileContainer(
            profileName: UILogic.player1Name,
            letter: UILogic.side == "X" ? "X" : "O",
            imageName: UILogic.player1ImageName),
        Column(
          children: [
            const Text(
              "D",
              style: AppConstants.scoreTextStyle,
            ),
            const Text(
              ":",
              style: AppConstants.scoreTextStyle,
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            Text(
              UILogic.draws.toString(),
              style: AppConstants.scoreTextStyle,
            ),
          ],
        ),
        ProfileContainer(
            profileName: UILogic.player2Name,
            letter: UILogic.side == "X" ? "O" : "X",
            imageName: UILogic.player2ImageName),
      ],
    );
  }
}
