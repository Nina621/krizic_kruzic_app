import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/constants/constants.dart';
import 'package:krizic_kruzic_app/model/game/ui_logic.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';
import 'package:krizic_kruzic_app/widgets/second_row_avatar_images.dart';
import 'first_row_avatar_image.dart';
import 'name_text_field_widget.dart';

class ParentColumnWidget extends StatefulWidget {
  @override
  _ParentColumnWidgetState createState() => _ParentColumnWidgetState();
}

class _ParentColumnWidgetState extends State<ParentColumnWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
           Padding(
            padding: EdgeInsets.only(bottom:Dimensions.height10),
            child: Text("SETTINGS",
                style: TextStyle( color: Colors.white,
                  fontFamily: 'Impact', fontSize:Dimensions.font25)),
          ),
          AppConstants.divider,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sound",
                style: AppConstants.settingsBoxLetterStyle,
              ),
              const SizedBox(
                width: 18.0,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    UILogic.muteSound = !UILogic.muteSound;
                  });
                },
                icon: Icon(
                  UILogic.muteSound ? Icons.volume_off : Icons.volume_up,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ],
          ),
          AppConstants.divider,
          const NameTextFieldWidget(
            setP1: true,
            setP2: false,
          ),
          FirsRowAvatarImage(),
          AppConstants.divider,
          const NameTextFieldWidget(
            setP1: false,
            setP2: true,
          ),
          SecondRowAvatarImage(),
          AppConstants.divider,
          Column(
            children: [
              Row(
                children: [
                  const Text(
                    "Win Score",
                    style: AppConstants.settingsBoxLetterStyle,
                  ),
                  const SizedBox(width: 18.0),
                  Row(
                    children: [
                      buildIconButton(true, false, Icons.arrow_upward),
                      Text(
                        UILogic.noOfWins.toString(),
                        style: AppConstants.settingsBoxLetterStyle,
                      ),
                      buildIconButton(true, false, Icons.arrow_downward),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Draw Score',
                    style: AppConstants.settingsBoxLetterStyle,
                  ),
                   SizedBox(width: Dimensions.width10),
                  Row(
                    children: [
                      buildIconButton(false, true, Icons.arrow_upward),
                      Text(
                        UILogic.noOfDraws.toString(),
                        style: AppConstants.settingsBoxLetterStyle,
                      ),
                      buildIconButton(false, true, Icons.arrow_downward),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  IconButton buildIconButton(bool wins, bool draws, IconData iconSymbol) {
    return IconButton(
      onPressed: () {
        if (wins == true && draws == false) {
          if (iconSymbol == Icons.arrow_upward) {
            if (UILogic.noOfWins < UILogic.maxWins) {
              setState(() {
                UILogic.noOfWins++;
              });
            }
          } else if (iconSymbol == Icons.arrow_downward) {
            if (UILogic.noOfWins > UILogic.minWins) {
              setState(() {
                UILogic.noOfWins--;
              });
            }
          }
        } else if (wins == false && draws == true) {
          if (iconSymbol == Icons.arrow_upward) {
            if (UILogic.noOfDraws < UILogic.maxWins) {
              setState(() {
                UILogic.noOfDraws++;
              });
            }
          } else if (iconSymbol == Icons.arrow_downward) {
            if (UILogic.noOfDraws > UILogic.minWins) {
              setState(() {
                UILogic.noOfDraws--;
              });
            }
          }
        }
      },
      icon: CircleAvatar(
        backgroundColor: wins == true && draws == false
            ? iconSymbol == Icons.arrow_upward
                ? UILogic.noOfWins < UILogic.maxWins
                    ? AppColors.primaryMainColor
                    : Colors.blueGrey[400]
                : UILogic.noOfWins > UILogic.minWins
                    ? AppColors.primaryMainColor
                    : Colors.blueGrey[400]
            : iconSymbol == Icons.arrow_upward
                ? UILogic.noOfDraws < UILogic.maxWins
                    ? AppColors.primaryMainColor
                    : Colors.blueGrey[400]
                : UILogic.noOfDraws > UILogic.minWins
                    ? AppColors.primaryMainColor
                    : Colors.blueGrey[400],
        child: Icon(
          iconSymbol,
          color: Colors.white,
        ),
      ),
    );
  }
}
