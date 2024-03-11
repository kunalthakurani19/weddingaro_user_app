import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weddingaro_user_app/model/response/user_details_model_with_token.dart';

class UserViewModal with ChangeNotifier {
  Future<bool> saveUser(UserDetailsModalWithToken user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    sp.setString('fname', user.fname.toString());
    sp.setString('lname', user.lname.toString());
    sp.setString('email', user.email.toString());
    sp.setString('profilePic', user.profilePic.toString());

    notifyListeners();
    return true;
  }

  Future<UserDetailsModalWithToken> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    final String? fname = sp.getString('fname');
    final String? lname = sp.getString('lname');
    final String? email = sp.getString('email');
    final String? profilePic = sp.getString('profilePic');

    return UserDetailsModalWithToken(
      token: token,
      fname: fname,
      lname: lname,
      email: email,
      profilePic: profilePic,
    );
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    sp.clear();
    return true;
  }
}
