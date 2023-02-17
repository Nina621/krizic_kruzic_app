import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/constants/constants.dart';
import 'package:krizic_kruzic_app/model/game/ui_logic.dart';
import 'package:krizic_kruzic_app/widgets/circle_avatars/second_circle_avatar.dart';

class SecondRowAvatarImage extends StatefulWidget {
  @override
  _SecondRowAvatarImageState createState() => _SecondRowAvatarImageState();
}

class _SecondRowAvatarImageState extends State<SecondRowAvatarImage> {
  @override
  Widget build(BuildContext context) {
    void toggleColor(String name) {
      for (var key in UILogic.avatar2Map.keys) {
        UILogic.avatar2Map[key] = AppColors.settingsBoxColor;
      }
      setState(() {
        UILogic.avatar2Map[name] = AppColors.profileContainerColor;
        UILogic.player2ImageName = name;
      });
    }

    return Row(
      children: [
        const Text(
          "Avatar",
          style: AppConstants.settingsBoxLetterStyle,
        ),
        Expanded(
            child: SecondCircleAvatarWidget(
                imageName: 'avatar-1', onTap: () => toggleColor('avatar-1'))),
        Expanded(
            child: SecondCircleAvatarWidget(
                imageName: 'avatar-2', onTap: () => toggleColor('avatar-2'))),
        Expanded(
            child: SecondCircleAvatarWidget(
                imageName: 'avatar-3', onTap: () => toggleColor('avatar-3'))),
        Expanded(
            child: SecondCircleAvatarWidget(
                imageName: 'avatar-4', onTap: () => toggleColor('avatar-4'))),
      ],
    );
  }
}
