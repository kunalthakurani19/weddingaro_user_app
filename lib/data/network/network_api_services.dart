import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weddingaro_user_app/data/app_exceptions.dart';
import 'package:weddingaro_user_app/data/network/base_api_service.dart';

class NetworkApiService extends BaseApiService {
  String? _token;

  // Method to retrieve token from SharedPreferences
  Future<void> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
  }

  @override
  Future getGetApiResponse(String url) async {
    await _getToken();
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $_token'},
      ).timeout(const Duration(seconds: 16));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    await _getToken();
    dynamic responseJson;
    try {
      Response response = await http.post(
        Uri.parse(url),
        body: data,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token', // Add token to headers
        },
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostFormApiResponse(String url, dynamic data) async {
    await _getToken();
    dynamic responseJson;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers['Authorization'] = 'Bearer $_token';
      request.fields.addAll(data);

      // If you have files to upload, you can add them like this:
      // formData.files.add(await http.MultipartFile.fromPath(
      //   'file',
      //   'path/to/file',
      //   contentType: MediaType('application', 'octet-stream'),
      // ));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostFormApiResponseForPhotosAndVideos(String url, dynamic data, List<File> images) async {
    await _getToken();
    dynamic responseJson;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers['Authorization'] = 'Bearer $_token';
      request.fields.addAll(data);
      for (var image in images) {
        request.files.add(await http.MultipartFile.fromPath(
          'storemedia',
          image.path,
        ));
      }
      // If you have files to upload, you can add them like this:
      // formData.files.add(await http.MultipartFile.fromPath(
      //   'file',
      //   'path/to/file',
      //   contentType: MediaType('application', 'octet-stream'),
      // ));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future<dynamic> getDeleteApiResponse(String url) async {
    await _getToken();
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $_token'},
      ).timeout(const Duration(seconds: 10));
      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future<dynamic> getDeleteApiResponseWithPayload(String url, dynamic data) async {
    await _getToken();
    try {
      final response = await http.delete(
        Uri.parse(url),
        body: data,
        headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $_token'},
      ).timeout(const Duration(seconds: 10));
      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future getUpdateApiResponse(String url, dynamic data) async {
    await _getToken();
    dynamic responseJson;
    try {
      Response response = await http.put(
        Uri.parse(url),
        body: data,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  // @override
  // Future getUpdateApiResponseWithFormData(String url, dynamic data) async {
  //   await _getToken();
  //   dynamic responseJson;
  //   try {
  //     Response response = await http.put(
  //       Uri.parse(url),
  //       body: data,
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $_token',
  //       },
  //     ).timeout(const Duration(seconds: 10));
  //     responseJson = returnResponse(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet Connection');
  //   }
  //   return responseJson;
  // }

  @override
  Future getUpdateApiResponseWithFormData(String url, dynamic data) async {
    await _getToken();
    dynamic responseJson;
    try {
      var request = http.MultipartRequest('PUT', Uri.parse(url));
      request.headers['Authorization'] = 'Bearer $_token';
      request.fields.addAll(data);

      // If you have files to upload, you can add them like this:
      // formData.files.add(await http.MultipartFile.fromPath(
      //   'file',
      //   'path/to/file',
      //   contentType: MediaType('application', 'octet-stream'),
      // ));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      // throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthroisedException(response.body.toString());
      default:
        throw FetchDataException('Error while Communicating with Server with status code${response.body.toString()}');
    }
  }
}
