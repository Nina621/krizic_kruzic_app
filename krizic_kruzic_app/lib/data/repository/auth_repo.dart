import 'package:get/get_connect/http/src/response/response.dart';
import 'package:krizic_kruzic_app/data/api/api_client.dart';
import 'package:krizic_kruzic_app/model/auth/auth_model.dart';
import 'package:krizic_kruzic_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> registration(AuthModel registration) async {
    return await apiClient.postData(
      AppConstants.REGISTRATION_URI,
      registration.toJson(),
    );
  }

  Future<String> getUserToken() async {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "None";
  }

  bool userLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<Response> login(AuthModel login) async {
    return await apiClient.postData(
      AppConstants.LOGIN_URI,
      login.toJson(),
    );
  }

  Future<Response> fetchMe() async {
    return await apiClient.getData(AppConstants.GET_USER_URI);
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(
      AppConstants.TOKEN,
      token,
    );
  }

  Future<Response> deleteUser() async {
    return await apiClient.deleteUser(AppConstants.GET_USER_URI);
  }

  bool logout() {
    sharedPreferences.remove(AppConstants.TOKEN);
    return true;
  }
}
