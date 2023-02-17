import 'package:get/get.dart';
import 'package:krizic_kruzic_app/controllers/auth_controller.dart';
import 'package:krizic_kruzic_app/controllers/game_controller.dart';
import 'package:krizic_kruzic_app/controllers/user_controller.dart';
import 'package:krizic_kruzic_app/data/api/api_client.dart';
import 'package:krizic_kruzic_app/data/repository/auth_repo.dart';
import 'package:krizic_kruzic_app/data/repository/game_repo.dart';
import 'package:krizic_kruzic_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.put(sharedPreferences, permanent: true);

  //initialize ApiClient
  Get.put(ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

  //repos
  Get.put(AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()),
      permanent: true);
  Get.put(GameRepo(apiClient: Get.find()), permanent: true);

  //controllers
  Get.put(AuthController(authRepo: Get.find()), permanent: true);
  Get.lazyPut(() => UserController());
  Get.lazyPut(() => GameController(gameRepo: Get.find()));
}
