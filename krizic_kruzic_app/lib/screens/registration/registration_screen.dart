import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krizic_kruzic_app/base/custom_loader.dart';
import 'package:krizic_kruzic_app/base/show_custom_snackbar.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/controllers/auth_controller.dart';
import 'package:krizic_kruzic_app/model/auth/auth_model.dart';
import 'package:krizic_kruzic_app/routes/route_helper.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';
import 'package:krizic_kruzic_app/widgets/app_icon.dart';
import 'package:krizic_kruzic_app/widgets/buttons/elevated_button.dart';
import 'package:krizic_kruzic_app/widgets/text/big_text.dart';
import 'package:krizic_kruzic_app/widgets/text_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with TickerProviderStateMixin {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void registration(AuthController authController) {
      String username = usernameController.text.trim();
      String password = passwordController.text.trim();

      if (username.isEmpty) {
        showCustomSnackBar("Please type username", title: "Username");
      } else if (password.isEmpty) {
        showCustomSnackBar("Please type your password", title: "Password");
      } else if (password.length <= 6) {
        showCustomSnackBar("Password can not be less than six characters",
            title: "Password");
      } else {
        AuthModel registration = AuthModel(
          username: username,
          password: password,
        );
        authController.registration(registration).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getLoginScreen());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: AppColors.primaryMainColor,
        body: GetBuilder<AuthController>(
          builder: (authController) {
            return !authController.isLoading
                ? SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: Dimensions.height50),
                        Padding(
                          padding: EdgeInsets.only(left: Dimensions.width20),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    Get.toNamed(RouteHelper.getLoginScreen()),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.width10),
                                  child: AppIcon(
                                    icon: Icons.arrow_back_ios,
                                    iconSize: Dimensions.iconSize24,
                                  ),
                                ),
                              ),
                              SizedBox(width: Dimensions.width10),
                              BigTextWidget(text: "REGISTER"),
                            ],
                          ),
                        ),
                        SizedBox(height: Dimensions.height140),
                        TextFieldWidget(
                          controller: usernameController,
                          text: "*Username...",
                        ),
                        SizedBox(height: Dimensions.height15),
                        TextFieldWidget(
                          controller: passwordController,
                          text: "*Password...",
                          obscureText: true,
                        ),
                        SizedBox(height: Dimensions.height250),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButtonWidget(
                            onPressed: () => registration(authController),
                            text: "REGISTER",
                            backgroundColor: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  )
                : const CustomLoader();
          },
        ));
  }
}
