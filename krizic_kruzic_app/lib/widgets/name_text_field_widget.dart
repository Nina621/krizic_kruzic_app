import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/constants/constants.dart';
import 'package:krizic_kruzic_app/model/game/ui_logic.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';

class NameTextFieldWidget extends StatelessWidget {
  final setP1, setP2;

  const NameTextFieldWidget({
    super.key,
    this.setP1,
    this.setP2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.height15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Your Name",
            style: AppConstants.settingsBoxLetterStyle,
          ),
          Padding(
            padding: EdgeInsets.only(left: Dimensions.width10),
            child: SizedBox(
              height: 45.0,
              width: 115.0,
              child: TextField(
                inputFormatters: [LengthLimitingTextInputFormatter(15)],
                style: const TextStyle(
                  color: AppColors.whiteColor,
                ),
                decoration: AppConstants.textFieldDecoration.copyWith(
                    hintText: setP1 ? UILogic.player1Name : UILogic.player2Name),
                onChanged: (value) {
                  setP1 ? UILogic.player1Name = value : UILogic.player2Name = value;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
