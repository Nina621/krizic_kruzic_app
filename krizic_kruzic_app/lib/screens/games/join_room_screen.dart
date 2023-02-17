import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/routes/route_helper.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';
import 'package:krizic_kruzic_app/widgets/app_icon.dart';
import 'package:krizic_kruzic_app/widgets/buttons/elevated_button.dart';
import 'package:krizic_kruzic_app/widgets/text/big_text.dart';

class JoinRoomScreen extends StatefulWidget {
  const JoinRoomScreen({Key? key}) : super(key: key);

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen>
    with TickerProviderStateMixin {
  final TextEditingController gameIdController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
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
    super.dispose();
    gameIdController.dispose();
    usernameController.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryMainColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ScaleTransition(
          scale: animation,
          child: Column(
            children: [
              SizedBox(height: Dimensions.height50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () =>
                        Get.toNamed(RouteHelper.getDashboardGameScreen()),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: Dimensions.width20),
                      child: AppIcon(
                        iconColor: AppColors.whiteColor,
                        icon: Icons.arrow_back_ios,
                        iconSize: Dimensions.iconSize24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: Dimensions.width90),
                    child: BigTextWidget(text: 'JOIN ROOM'),
                  ),
                ],
              ),
              SizedBox(height: Dimensions.height132),
              Image.asset(
                "assets/images/join.png",
                width: Dimensions.height180,
              ),
              SizedBox(height: Dimensions.height80),
              ElevatedButtonWidget(
                onPressed: () => Get.offNamed(RouteHelper.getWelcomeScreen()),
                text: 'Join',
                backgroundColor: AppColors.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
