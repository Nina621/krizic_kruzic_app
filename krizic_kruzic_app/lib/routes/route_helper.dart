import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:krizic_kruzic_app/model/game/ui_logic.dart';
import 'package:krizic_kruzic_app/screens/dashboard_screen.dart';
import 'package:krizic_kruzic_app/screens/games/dashboard_game_screen.dart';
import 'package:krizic_kruzic_app/screens/games/game_screen.dart';
import 'package:krizic_kruzic_app/screens/games/join_room_screen.dart';
import 'package:krizic_kruzic_app/screens/games/pickup_screen.dart';
import 'package:krizic_kruzic_app/screens/games/result_screen.dart';
import 'package:krizic_kruzic_app/screens/games/welcome_screen.dart';
import 'package:krizic_kruzic_app/screens/login/login_screen.dart';
import 'package:krizic_kruzic_app/screens/registration/registration_screen.dart';
import 'package:krizic_kruzic_app/screens/splash/splash_screen.dart';
import 'package:krizic_kruzic_app/screens/user_screen.dart';

class RouteHelper {
  static const String splashScreen = "/splash";
  static const String registrationScreen = "/registration";
  static const String loginScreen = "/login";
  static const String dashboardScreen = "/dashboard";
  static const String newDashboardGameScreen = "/newDashboardGame";
  static const String userScreen = "/user";
  static const String createRoomScreen = "/createRoom";
  static const String joinRoomScreen = "/joinRoom";
  static const String welcomeScreen = "/welcome";
  static const String gameScreen = "/game";
  static const String pickUpScreen = "/pickUp";
  static const String resultScreen = "/result";

  static String getSplashScreen() => splashScreen;

  static String getRegistrationScreen() => registrationScreen;

  static String getLoginScreen() => loginScreen;

  static String getDashboardScreen() => dashboardScreen;

  static String getDashboardGameScreen() => newDashboardGameScreen;

  static String getUserScreen() => userScreen;

  static String getCreateRoomScreen() => createRoomScreen;

  static String getJoinRoomScreen() => joinRoomScreen;

  static String getWelcomeScreen() => welcomeScreen;

  static String getGameScreen() => gameScreen;

  static String getPickUpScreen() => pickUpScreen;

  static String getResultScreen() => resultScreen;

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: registrationScreen, page: () => const RegistrationScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: dashboardScreen, page: () => const DashboardScreen()),
    GetPage(
        name: newDashboardGameScreen, page: () => const DashboardGameScreen()),
    GetPage(name: userScreen, page: () => const UserScreen()),
    GetPage(name: joinRoomScreen, page: () => const JoinRoomScreen()),
    GetPage(name: welcomeScreen, page: () => WelcomeScreen()),
    GetPage(
        name: gameScreen,
        page: () => GameScreen(
              chosenLetter: UILogic.side,
            )),
    GetPage(name: pickUpScreen, page: () => PickUpScreen()),
    GetPage(name: resultScreen, page: () => const ResultScreen()),
  ];
}
