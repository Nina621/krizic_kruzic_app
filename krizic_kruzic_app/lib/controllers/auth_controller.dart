import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:krizic_kruzic_app/data/repository/auth_repo.dart';
import 'package:krizic_kruzic_app/model/auth/auth_model.dart';
import 'package:krizic_kruzic_app/model/auth/user.dart';
import 'package:krizic_kruzic_app/model/response_model.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({
    required this.authRepo,
  });

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  late User _user;

  User get user => _user;

  Future<ResponseModel> registration(AuthModel registration) async {
    _isLoading = true;
    update();
    Response response = await authRepo.registration(registration);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      responseModel =
          ResponseModel(isSuccess: true, message: response.statusText!);
    } else {
      responseModel =
          ResponseModel(isSuccess: false, message: response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(AuthModel login) async {
    authRepo.getUserToken();
    _isLoading = true;
    update();
    Response response = await authRepo.login(login);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      // getUserInfo();
      responseModel =
          ResponseModel(isSuccess: true, message: response.body["token"]);
    } else {
      responseModel =
          ResponseModel(isSuccess: false, message: response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  bool userLoggedIn() {
    return authRepo.userLoggedIn();
  }

  bool logout() {
    return authRepo.logout();
  }
}
