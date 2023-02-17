import 'package:get/get.dart';

class UserController extends GetxController implements GetxService {
  var isProfilePicPathSet = false.obs;
  var profilePicPath = ''.obs;

  void setProfileImagePath(String path) async {
    profilePicPath.value = path;
    isProfilePicPathSet.value = true;
  }
}
