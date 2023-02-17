import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:krizic_kruzic_app/controllers/user_controller.dart';

class CircleAvatarWidget extends StatelessWidget {
  Color? color;
  double? firstRadius;
  double? secondRadius;
  File? imageFile;
  ImagePicker imagePicker = ImagePicker();
  UserController userController = Get.find();

  CircleAvatarWidget({
    Key? key,
    this.color = const Color(0xFFFFFFFF),
    this.firstRadius = 60.0,
    this.secondRadius = 58.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CircleAvatar(
        backgroundColor: color,
        radius: firstRadius,
        child: CircleAvatar(
          backgroundImage: userController.isProfilePicPathSet.value == true
              ? FileImage(File(userController.profilePicPath.value))
                  as ImageProvider
              : const AssetImage('assets/images/user.png'),
          radius: secondRadius,
        ),
      ),
    );
  }
}
