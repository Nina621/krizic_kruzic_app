import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/model/enum/letter.dart';
import 'package:krizic_kruzic_app/model/game/ui_logic.dart';
import 'package:krizic_kruzic_app/routes/route_helper.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';
import 'package:krizic_kruzic_app/widgets/buttons/elevated_button.dart';
import 'package:krizic_kruzic_app/widgets/container_widget.dart';
import 'package:krizic_kruzic_app/widgets/wp_screen_text_widget.dart';

import 'game_screen.dart';

class PickUpScreen extends StatefulWidget {
  @override
  _PickUpScreenState createState() => _PickUpScreenState();
}

class _PickUpScreenState extends State<PickUpScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    ui.colorsAndSide();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
  }

  void updateColor(Letter selectedLetter) => ui.updateColor(selectedLetter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryMainColor,
      body: SafeArea(
        child: ScaleTransition(
          scale: animation,
          child: Column(
            children: [
              Center(
                child: Padding(
                    padding: EdgeInsets.all(Dimensions.height20),
                    child: TextWidget(
                      text: 'CHOOSE SIDE',
                      fontSize: Dimensions.font42,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColor(Letter.CARD_X);
                      UILogic.side = "X";
                    });
                  },
                  child: ContainerWidget(
                    color: UILogic.xCardColor,
                    text: "X",
                    textColor: UILogic.xTextColor,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColor(Letter.CARD_O);
                      UILogic.side = "O";
                    });
                  },
                  child: ContainerWidget(
                    color: UILogic.oCardColor,
                    text: "O",
                    textColor: UILogic.oTextColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.height15,
                    right: Dimensions.height15,
                    bottom: Dimensions.height20),
                child: ElevatedButtonWidget(
                  onPressed: () {
                    ui.remainingVars();
                    ui.setWinningVariables();
                    Get.offNamed(RouteHelper.getGameScreen());
                  },
                  text: 'Start',
                  backgroundColor: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
