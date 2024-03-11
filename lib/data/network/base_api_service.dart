import 'dart:io';

abstract class BaseApiService {
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url, dynamic data);
  Future<dynamic> getPostFormApiResponse(String url, dynamic data);
  Future<dynamic> getPostFormApiResponseForPhotosAndVideos(String url, dynamic data, List<File> images);
  Future<dynamic> getDeleteApiResponse(String url);
  Future<dynamic> getDeleteApiResponseWithPayload(String url, dynamic data);
  Future<dynamic> getUpdateApiResponse(String url, dynamic data);
  Future<dynamic> getUpdateApiResponseWithFormData(String url, dynamic data);
}
