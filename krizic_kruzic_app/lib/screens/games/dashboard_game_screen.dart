import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/routes/route_helper.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';
import 'package:krizic_kruzic_app/widgets/app_icon.dart';
import 'package:krizic_kruzic_app/widgets/buttons/elevated_button.dart';
import 'package:krizic_kruzic_app/widgets/text/big_text.dart';

class DashboardGameScreen extends StatefulWidget {
  const DashboardGameScreen({Key? key}) : super(key: key);

  @override
  State<DashboardGameScreen> createState() => _DashboardGameScreenState();
}

class _DashboardGameScreenState extends State<DashboardGameScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
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
        body: Align(
          alignment: Alignment.topCenter,
          child: ScaleTransition(
            scale: animation,
            child: Column(
              children: [
                SizedBox(height: Dimensions.height60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          Get.toNamed(RouteHelper.getDashboardScreen()),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width15),
                        child: AppIcon(
                          iconColor: AppColors.whiteColor,
                          icon: Icons.arrow_back_ios,
                          iconSize: Dimensions.iconSize24,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: Dimensions.width60),
                      child: BigTextWidget(text: 'TIC TAC TOE'),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.height80),
                Image.asset(
                  "assets/images/tic_tac_logo.png",
                  width: Dimensions.width150,
                ),
                SizedBox(height: Dimensions.height80),
                const SizedBox(height: 20),
                ElevatedButtonWidget(
                  onPressed: () =>
                      Get.offNamed(RouteHelper.getJoinRoomScreen()),
                  text: 'Join Room',
                  backgroundColor: AppColors.whiteColor,
                ),
              ],
            ),
          ),
        ));
  }
}
