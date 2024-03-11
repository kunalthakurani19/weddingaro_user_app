import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weddingaro_user_app/utils/routes/routes_name.dart';
import 'package:weddingaro_user_app/view_model/user_view_modal.dart';

import '../../model/response/user_details_model_with_token.dart';

class SplashServices {
  Future<UserDetailsModalWithToken> getUserData() => UserViewModal().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      if (value.token.toString() == 'null' || value.token.toString() == '' || value.token == null) {
        if (kDebugMode) {
          print("token:${value.token}");
        }

        Future.delayed(const Duration(seconds: 2));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        if (kDebugMode) {
          print("token:${value.token}");
        }
        Future.delayed(const Duration(seconds: 2));
        Navigator.pushNamed(context, RoutesName.mainScreen);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
