import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';
import 'package:krizic_kruzic_app/widgets/text/big_text.dart';
import 'package:krizic_kruzic_app/widgets/text/small_text.dart';

import 'buttons/icon_button.dart';

class AlertDialogWithoutTextFields extends StatelessWidget {
  final String text;
  String smallText;
  final VoidCallback onPressedClose;
  final VoidCallback onPressedCheck;
  double oneHeight;
  double twoHeight;

  AlertDialogWithoutTextFields({
    Key? key,
    required this.text,
    this.smallText = "",
    required this.onPressedCheck,
    required this.onPressedClose,
    this.oneHeight = 20,
    this.twoHeight = 130,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.primaryMainColor,
      title: Center(
        child: BigTextWidget(
          text: text,
          color: AppColors.whiteColor,
          size: Dimensions.font25,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(Dimensions.radius10),
        ),
      ),
      content: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: SizedBox(
              height: Dimensions.alertDialogHeight,
              child: Column(
                children: [
                  SizedBox(height: oneHeight),
                  SmallTextWidget(text: smallText),
                  SizedBox(height: twoHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButtonWidget(
                        icon: Icons.close,
                        onPressed: onPressedClose,
                        backgroundColor: AppColors.whiteColor,
                      ),
                      IconButtonWidget(
                        icon: Icons.check,
                        onPressed: onPressedCheck,
                        iconColor: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
