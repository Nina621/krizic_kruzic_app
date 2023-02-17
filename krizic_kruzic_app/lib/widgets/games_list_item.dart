import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';
import 'package:krizic_kruzic_app/widgets/custom_container.dart';
import 'package:krizic_kruzic_app/widgets/text/big_text.dart';

class GameListItem extends StatelessWidget {
  final String firstPlayer;
  final String secondPlayer;
  final String status;

  const GameListItem({
    Key? key,
    required this.firstPlayer,
    required this.secondPlayer,
    required this.status,
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
                  text: 'Players:  $firstPlayer :  $secondPlayer',
                  color: AppColors.whiteColor,
                  size: Dimensions.font25,
                ),
                SizedBox(height: Dimensions.height20),
                BigTextWidget(
                    text: 'Game status: $status ',
                    color: AppColors.whiteColor,
                    size: Dimensions.font20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
