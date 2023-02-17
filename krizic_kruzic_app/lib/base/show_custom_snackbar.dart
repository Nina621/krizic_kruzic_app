import 'package:get/get.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';
import 'package:krizic_kruzic_app/widgets/text/big_text.dart';
import 'package:krizic_kruzic_app/widgets/text/small_text.dart';

void showCustomSnackBar(String message,
    {bool isError = true, String title = "Error"}) {
  Get.snackbar(
    title,
    message,
    titleText: BigTextWidget(
      text: title,
      color: AppColors.activeColor,
      size: Dimensions.width20,
    ),
    messageText: SmallTextWidget(
      text: message,
      color: AppColors.activeColor,
      height: 0,
      size: Dimensions.width15,
    ),
    snackPosition: SnackPosition.TOP,
    backgroundColor: AppColors.whiteColor,
  );
}
