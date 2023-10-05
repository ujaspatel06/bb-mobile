import 'package:budget_buddie/Data/Api/api_constants.dart';
import 'package:budget_buddie/Data/Api/api_manager.dart';
import 'package:budget_buddie/Data/Models/common_msg_model.dart';

class ChangePassRepository {
  ApiManager apiManager = ApiManager();
  Future<CommonMsgModel> changePassword(Map<String, String> parameters) async {
    try {
      var response =
          await apiManager.post(APIConstants.changePassword, parameters);
      var responseMap = CommonMsgModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }
}
