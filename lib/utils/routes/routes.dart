import 'package:flutter/material.dart';
import 'package:weddingaro_user_app/screens/afterAuthScreens/main_screen.dart';
import 'package:weddingaro_user_app/screens/auth_screens/forgot_screen.dart';
import 'package:weddingaro_user_app/screens/auth_screens/login_screen.dart';
import 'package:weddingaro_user_app/screens/auth_screens/signup_screen.dart';
import 'package:weddingaro_user_app/screens/home_screen.dart';
import 'package:weddingaro_user_app/screens/splash_screen.dart';
import 'package:weddingaro_user_app/utils/routes/routes_name.dart';

import '../../screens/auth_screens/reset_password.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //home and splash
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());

      case RoutesName.mainScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const MainScreen());

      //auth route
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginScreen());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (BuildContext context) => const SignUpScreen());
      case RoutesName.forgotpassword:
        return MaterialPageRoute(builder: (BuildContext context) => const ForgotScreen());
      case RoutesName.resetPassword:
        return MaterialPageRoute(builder: (BuildContext context) => const ResetPassword());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No Route Defined'),
            ),
          );
        });
    }
  }
}
