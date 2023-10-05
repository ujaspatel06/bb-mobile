import 'package:budget_buddie/Data/Api/api_constants.dart';
import 'package:budget_buddie/Data/Api/api_manager.dart';
import 'package:budget_buddie/Data/Models/user_model.dart';

class LoginRepository {
  ApiManager apiManager = ApiManager();
  Future<UserModel> login(Map<String, String> parameters) async {
    try {
      var response = await apiManager.post(APIConstants.login, parameters,isLoaderShow: false);
      var responseMap = UserModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }
}
