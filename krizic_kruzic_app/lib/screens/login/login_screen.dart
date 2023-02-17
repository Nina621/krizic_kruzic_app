import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krizic_kruzic_app/base/custom_loader.dart';
import 'package:krizic_kruzic_app/base/show_custom_snackbar.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/controllers/auth_controller.dart';
import 'package:krizic_kruzic_app/model/auth/auth_model.dart';
import 'package:krizic_kruzic_app/routes/route_helper.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';
import 'package:krizic_kruzic_app/widgets/buttons/elevated_button.dart';
import 'package:krizic_kruzic_app/widgets/buttons/text_button.dart';
import 'package:krizic_kruzic_app/widgets/text/small_text.dart';
import 'package:krizic_kruzic_app/widgets/text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void _login(AuthController authController) {
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
        AuthModel login = AuthModel(
          username: username,
          password: password,
        );
        authController.login(login).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getDashboardScreen());
          } else {
            showCustomSnackBar(
              "Please check your credentials",
              title: "Error",
            );
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: AppColors.primaryMainColor,
      body: GetBuilder<AuthController>(builder: (controller) {
        return !controller.isLoading
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: Dimensions.height60),
                    Center(
                        child: Image.asset(
                      "assets/images/tic_tac_logo.png",
                      width: Dimensions.width150,
                    )),
                    SizedBox(height: Dimensions.height30),
                    SmallTextWidget(text: "Please login to proceed"),
                    SizedBox(height: Dimensions.height50),
                    TextFieldWidget(
                        controller: usernameController, text: "Username..."),
                    SizedBox(height: Dimensions.height15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldWidget(
                          controller: passwordController,
                          text: "Password...",
                          obscureText: true,
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.height50),
                    Padding(
                      padding: EdgeInsets.only(left: Dimensions.width15),
                      child: TextButtonWidget(
                        text: "DON'T HAVE ACCOUNT? REGISTER HERE",
                        onPressed: () => Get.toNamed(
                          RouteHelper.getRegistrationScreen(),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height80),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButtonWidget(
                        onPressed: () => _login(controller),
                        text: "LOGIN",
                        backgroundColor: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              )
            : const CustomLoader();
      }),
    );
  }
}
