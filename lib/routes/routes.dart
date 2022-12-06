import 'package:get/get.dart';
import 'package:trasn_human_resource_managment/view/forgetpassword_page.dart';
import 'package:trasn_human_resource_managment/view/login_page.dart';
import '../view/dashboard_page.dart';
import '../view/splash_screen.dart';

class MyRoutes {
  static List<GetPage> viewPages = [
    GetPage(name: '/splashScreen', page: () => const SplashPageScreen()),
    GetPage(name: '/loginScreen', page: () => const LoginScreen()),
    GetPage(name: '/forgotScreen', page: () => const ForgotPasswordScreen()),
    GetPage(name: '/dashBoardScreen', page: () => const DashBoardPage()),
  ];
}
