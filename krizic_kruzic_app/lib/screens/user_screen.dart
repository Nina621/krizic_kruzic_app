import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:krizic_kruzic_app/base/show_custom_snackbar.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/controllers/auth_controller.dart';
import 'package:krizic_kruzic_app/routes/route_helper.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';
import 'package:krizic_kruzic_app/widgets/alert_dialog.dart';
import 'package:krizic_kruzic_app/widgets/app_icon.dart';
import 'package:krizic_kruzic_app/widgets/bottom_sheet.dart';
import 'package:krizic_kruzic_app/widgets/circle_avatar_widgets.dart';
import 'package:krizic_kruzic_app/widgets/text/big_text.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryMainColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  top: Dimensions.height60,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          Get.toNamed(RouteHelper.getDashboardScreen()),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width10),
                        child: AppIcon(
                          iconColor: AppColors.whiteColor,
                          icon: Icons.arrow_back_ios,
                          iconSize: Dimensions.iconSize24,
                        ),
                      ),
                    ),
                    BigTextWidget(
                      text: "MY PROFILE",
                      color: AppColors.whiteColor,
                      size: Dimensions.font40,
                    ),
                    PopupMenuButton(
                      icon: SvgPicture.asset(
                        "assets/images/dots_menu_icon.svg",
                        color: AppColors.whiteColor,
                      ),
                      color: AppColors.secondaryMainColor,
                      iconSize: Dimensions.iconSize24,
                      itemBuilder: (BuildContext ctx) => [
                        PopupMenuItem(
                          value: 'Logout',
                          child: InkWell(
                            onTap: () => Get.dialog(
                              AlertDialogWithoutTextFields(
                                text: "LOGOUT",
                                smallText: "Are you sure you want to log out?",
                                twoHeight: Dimensions.alertDialogHeight / 2.1,
                                onPressedClose: () => Get.back(),
                                onPressedCheck: () {
                                  if (Get.find<AuthController>()
                                      .userLoggedIn()) {
                                    Get.find<AuthController>().logout();
                                    Get.offNamed(RouteHelper.getLoginScreen());
                                  } else {
                                    showCustomSnackBar("User is logout",
                                        title: "Logout");
                                  }
                                },
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: Dimensions.width10,
                                ),
                                const Text(
                                  'Logout',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  CircleAvatarWidget(),
                  Positioned(
                    right: Dimensions.width1,
                    bottom: Dimensions.width2,
                    child: const AppIcon(
                      icon: Icons.circle,
                      iconColor: Colors.transparent,
                      backgroundColor: AppColors.firstTabColor,
                    ),
                  ),
                  Positioned(
                    left: Dimensions.width90,
                    top: Dimensions.height86,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => BottomSheetWidget()),
                        );
                      },
                      child: Center(
                        child: Icon(
                          Icons.edit_outlined,
                          color: AppColors.secondaryMainColor,
                          size: Dimensions.width20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              BigTextWidget(
                text: "Test1235",
                //authController.user.nickname ?? "-",
                size: Dimensions.font20,
              ),
            ],
          ),
        ));
  }
}
