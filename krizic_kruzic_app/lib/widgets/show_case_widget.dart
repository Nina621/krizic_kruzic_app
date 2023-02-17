import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';
import 'package:krizic_kruzic_app/widgets/parent_column.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:showcaseview/showcaseview.dart';

class ShowCase extends StatelessWidget {
  const ShowCase({
    Key? key,
    required this.keyOne,
  }) : super(key: key);

  final GlobalKey<State<StatefulWidget>> keyOne;

  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: keyOne,
      description: 'Set up your profile',
      showcaseBackgroundColor: AppColors.profileContainerColor,
      contentPadding: const EdgeInsets.all(8),
      overlayOpacity: 0.75,
      showArrow: true,
      shapeBorder: const CircleBorder(),
      descTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
      child: IconButton(
        onPressed: () {
          Alert(
              style: AlertStyle(
                backgroundColor: const Color(0xFF9b70e5),
                alertPadding:
                    EdgeInsets.symmetric(horizontal: Dimensions.width25),
              ),
              context: context,
              content: ParentColumnWidget(),
              buttons: [
                DialogButton(
                  color: AppColors.whiteColor,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Done",
                    style: TextStyle(
                      color: AppColors.activeColor,
                      fontSize: Dimensions.font20,
                      fontFamily: 'Impact',
                    ),
                  ),
                ),
              ]).show();
        },
        icon: const Icon(
          Icons.view_headline,
          size: 30.0,
        ),
      ),
    );
  }
}
