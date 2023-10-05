import 'package:budget_buddie/Data/Api/api_constants.dart';
import 'package:budget_buddie/Data/Api/api_manager.dart';
import 'package:budget_buddie/Data/Models/common_msg_model.dart';

class ForgotPassRepository {
  ApiManager apiManager = ApiManager();
  Future<CommonMsgModel> forgotPass(Map<String, String> parameters) async {
    try {
      var response =
          await apiManager.post(APIConstants.forgotPassword, parameters,isLoaderShow: false);
      var responseMap = CommonMsgModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }
}
