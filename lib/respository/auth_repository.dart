import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:trasn_human_resource_managment/respository/reponse/network_reponse.dart';
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
}
