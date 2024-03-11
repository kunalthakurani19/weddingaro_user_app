import 'package:flutter/foundation.dart';
import 'package:weddingaro_user_app/data/response/api_response.dart';
import 'package:weddingaro_user_app/model/response/getall_checklist_model.dart';
import 'package:weddingaro_user_app/repository/checklist_repository.dart';

class CheckListViewModel with ChangeNotifier {
  final checklistRepo = CheckListRepository();

  ApiResponse<GetAllCheckListModel> enquiryList = ApiResponse.loading();

  setEnquiryList(ApiResponse<GetAllCheckListModel> resposne) {
    enquiryList = resposne;
    notifyListeners();
  }

  Future<void> fetchCheckList() async {
    setEnquiryList(ApiResponse.loading());

    checklistRepo.fetchCheckList().then((value) {
      setEnquiryList(ApiResponse.completed(value));
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setEnquiryList(ApiResponse.error(error.toString()));
    });
  }
}
