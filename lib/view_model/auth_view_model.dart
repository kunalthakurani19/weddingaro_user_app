import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weddingaro_user_app/model/response/user_details_model_with_token.dart';
import 'package:weddingaro_user_app/repository/auth_repository.dart';
import 'package:weddingaro_user_app/utils/app_data_manager.dart';
import 'package:weddingaro_user_app/utils/routes/routes_name.dart';
import 'package:weddingaro_user_app/utils/utils.dart';

import 'user_view_modal.dart';

class AuthViewModel with ChangeNotifier {
  final myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signupLoading = false;
  bool get signuploading => _signupLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignupLoading(bool value) {
    _signupLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    myRepo.loginApi(data).then((value) {
      setLoading(false);
      final userPrefrence = Provider.of<UserViewModal>(context, listen: false);
      AppDataManager().setUserToken(value['token'].toString());
      AppDataManager().setLoggedIn(true);
      userPrefrence.saveUser(
        UserDetailsModalWithToken(
          token: value['token'].toString(),
          email: value['details']['email'].toString(),
          fname: value['details']['fname'].toString(),
          lname: value['details']['lname'].toString(),
          profilePic: value['details']['profilePic'].toString(),
        ),
      );

      Navigator.pushNamed(context, RoutesName.mainScreen);
      if (kDebugMode) {
        print(value.toString());
      }
      Utils.flushBarSucessMessage("login sucessful", context);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> resgisterApi(dynamic data, BuildContext context) async {
    setSignupLoading(true);
    myRepo.registerApi(data).then((value) {
      setSignupLoading(false);
      Navigator.pushNamed(context, RoutesName.login);
      Utils.flushBarSucessMessage('You are successfully register check your mail to activate your account then LOGIN', context);
    }).onError((error, stackTrace) {
      setSignupLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> forgotPasswordApi(dynamic data, BuildContext context) async {
    setSignupLoading(true);
    myRepo.forgotPasswordApi(data).then((value) {
      setSignupLoading(false);

      Navigator.pushNamed(context, RoutesName.login);
      Utils.flushBarSucessMessage('Reset link send successfull please check your mail', context);
    }).onError((error, stackTrace) {
      setSignupLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
