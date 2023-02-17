import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';
import 'package:krizic_kruzic_app/widgets/text/small_text.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SmallTextWidget(
          text: "Your collection list is empty",
          color: AppColors.firstTabColor,
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Image.asset("assets/images/sad_face.png",color: AppColors.firstTabColor, width: Dimensions.width150,),
      ],
    );
  }
}
