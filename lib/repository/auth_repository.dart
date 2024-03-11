import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:weddingaro_user_app/data/network/network_api_services.dart';
import 'package:weddingaro_user_app/resources/app_url.dart';

import '../data/network/base_api_service.dart';

class AuthRepository {
  BaseApiService apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      if (kDebugMode) {
        print(data);
      }
      dynamic response = await apiServices.getPostApiResponse(AppUrl.loginUrl, jsonEncode(data));

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(AppUrl.registerApiEndPointUrl, jsonEncode(data));

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> forgotPasswordApi(dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(AppUrl.forgotPasswordUrl, jsonEncode(data));

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
