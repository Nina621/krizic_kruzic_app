import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/model/game/ui_logic.dart';

class FirstCircleAvatarWidget extends StatelessWidget {
  final imageName, color, onTap;

  const FirstCircleAvatarWidget({
    super.key,
    this.imageName,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 23.0,
        backgroundColor: UILogic.avatar1Map[imageName],
        child: LayoutBuilder(
          builder: (context, constraints) => Image(
            image: AssetImage("assets/images/$imageName.png"),
            height: constraints.maxHeight * 0.85,
            width: constraints.maxWidth * 0.85,
          ),
        ),
      ),
    );
  }
}
