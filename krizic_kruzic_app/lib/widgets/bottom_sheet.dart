import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/controllers/user_controller.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';
import 'package:krizic_kruzic_app/widgets/text/big_text.dart';

import 'buttons/text_button.dart';

class BottomSheetWidget extends StatelessWidget {
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();

  BottomSheetWidget({Key? key}) : super(key: key);

  UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryMainColor,
      height: Dimensions.height132,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            height: Dimensions.height20,
          ),
          BigTextWidget(
            text: "CHOSE PROFILE PHOTO",
            size: Dimensions.font20,
            color: AppColors.whiteColor,
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButtonWidget(
                icon: Icons.camera,
                color: AppColors.whiteColor,
                text: "Camera",
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
              ),
              TextButtonWidget(
                icon: Icons.image,
                text: "Gallery",
                color: AppColors.whiteColor,
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);
    pickedFile = File(pickedImage!.path);
    userController.setProfileImagePath(pickedFile!.path);
    Get.back();
  }
}
