import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';
import 'package:krizic_kruzic_app/widgets/custom_container.dart';
import 'package:krizic_kruzic_app/widgets/text/big_text.dart';

class PlayerListItem extends StatelessWidget {
  final String nickname;
  final String points;
  final String wins;

  const PlayerListItem({
    Key? key,
    required this.nickname,
    required this.points,
    required this.wins,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: Dimensions.height132,
      child: Container(
        margin: EdgeInsets.only(
            top: Dimensions.height10,
            bottom: Dimensions.height10,
            left: Dimensions.width30,
            right: Dimensions.width30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigTextWidget(
                  text: nickname,
                  color: AppColors.whiteColor,
                  size: Dimensions.font30,
                ),
                SizedBox(height: Dimensions.height10),
                BigTextWidget(
                    text: points.toString(),
                    color: AppColors.whiteColor,
                    size: Dimensions.font20),
                SizedBox(height: Dimensions.height10),
                BigTextWidget(
                    text: wins.toString(),
                    color: AppColors.whiteColor,
                    size: Dimensions.font20)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
