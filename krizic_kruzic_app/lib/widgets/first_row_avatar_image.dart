import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/constants/constants.dart';
import 'package:krizic_kruzic_app/model/game/ui_logic.dart';
import 'package:krizic_kruzic_app/widgets/circle_avatars/first_circle_avatar.dart';

class FirsRowAvatarImage extends StatefulWidget {
  @override
  _FirsRowAvatarImageState createState() => _FirsRowAvatarImageState();
}

class _FirsRowAvatarImageState extends State<FirsRowAvatarImage> {
  @override
  Widget build(BuildContext context) {
    void toggleColor(String name) {
      for (var key in UILogic.avatar1Map.keys) {
        UILogic.avatar1Map[key] = AppColors.settingsBoxColor;
      }

      setState(() {
        UILogic.avatar1Map[name] = AppColors.profileContainerColor;
        UILogic.player1ImageName = name;
      });
    }

    return Row(
      children: [
        const Text("Avatar", style: AppConstants.settingsBoxLetterStyle),
        Expanded(
            child: FirstCircleAvatarWidget(
                imageName: 'avatar-1', onTap: () => toggleColor('avatar-1'))),
        Expanded(
            child: FirstCircleAvatarWidget(
                imageName: 'avatar-2', onTap: () => toggleColor('avatar-2'))),
        Expanded(
            child: FirstCircleAvatarWidget(
                imageName: 'avatar-3', onTap: () => toggleColor('avatar-3'))),
        Expanded(
            child: FirstCircleAvatarWidget(
                imageName: 'avatar-4', onTap: () => toggleColor('avatar-4'))),
      ],
    );
  }
}
