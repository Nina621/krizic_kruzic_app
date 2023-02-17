import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/constants/constants.dart';
import 'package:krizic_kruzic_app/routes/route_helper.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';
import 'package:krizic_kruzic_app/widgets/buttons/elevated_button.dart';
import 'package:krizic_kruzic_app/widgets/show_case_widget.dart';
import 'package:krizic_kruzic_app/widgets/wp_screen_text_widget.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  final keyOne = GlobalKey();
  late Animation<double> animation;
  late AnimationController controller;

  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryMainColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryMainColor,
        leading: ShowCase(keyOne: keyOne),
        title: Align(
          alignment: Alignment.topCenter,
          child: TextWidget(
            text: "TIC TAC TOE",
            fontSize: Dimensions.font42,
          ),
        ),
      ),
      body: SafeArea(
        child: ScaleTransition(
          scale: animation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) => Text(
                        "X",
                        style: TextStyle(
                            color: AppConstants.letterXColor,
                            fontSize: constraints.maxHeight / 3.0,
                            fontFamily: 'Impact'),
                      ),
                    ),
                    LayoutBuilder(
                      builder: (context, constraints) => Text(
                        "O",
                        style: TextStyle(
                            color: AppConstants.letterOColor,
                            fontSize: constraints.maxHeight / 3.0,
                            fontFamily: 'Impact'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.height15,
                    right: Dimensions.height15,
                    bottom: Dimensions.height20),
                child: ElevatedButtonWidget(
                  onPressed: () => Get.offNamed(RouteHelper.getPickUpScreen()),
                  text: 'Pick Side',
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
