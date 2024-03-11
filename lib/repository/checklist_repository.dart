import 'package:weddingaro_user_app/data/network/base_api_service.dart';
import 'package:weddingaro_user_app/model/response/getall_checklist_model.dart';
import 'package:weddingaro_user_app/resources/app_url.dart';

import '../data/network/network_api_services.dart';

class CheckListRepository {
  BaseApiService apiServices = NetworkApiService();
  Future<GetAllCheckListModel> fetchCheckList() async {
    try {
      dynamic response = await apiServices.getGetApiResponse('https://api.weddingaro.com/api/user/get-all-task?limit=10&page=1');
      return response = GetAllCheckListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
