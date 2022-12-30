import 'package:trasn_human_resource_managment/respository/reponse/network_reponse.dart';
import '../model/user_profile_model.dart';
import 'network/api_service.dart';
import 'network/base_client.dart';

class AuthRepository {
  BaseApi apiService = Network();

  Future<String> getLoginApi(dynamic userName, dynamic passWord) async {
    final response = await apiService.fetchGetApiResponse(
        '${Api.baseUrl}${Api.loginApi(userName, passWord)}');
    return response;
  }

  Future<String> getForgotApi(dynamic userName) async {
    final response = await apiService
        .fetchGetApiResponse('${Api.baseUrl}${Api.forgotApi(userName)}');
    return response;
  }

  Future<String> getSecurityApi(dynamic userName) async {
    final response = await apiService
        .fetchGetApiResponse('${Api.baseUrl}${Api.securityCodeApi(userName)}');
    return response;
  }

  Future<UserProfileModel> userProfile(dynamic userName) async {
    try {
      var response = await apiService
          .fetchGetApiResponse('${Api.baseUrl}${Api.userProfileApi(userName)}');
      return response = UserProfileModel.fromJson(response);
    } on Exception catch (e) {
      throw e.toString();
    }
  }
}
