import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:trasn_human_resource_managment/respository/network/base_client.dart';
import 'package:http/http.dart' as http;

class Network extends BaseApi {
  @override
  Future fetchGetApiResponse(String url) async {
    dynamic getJsonResponse;
    try {
      var response = await http.get(Uri.parse(url));
      getJsonResponse = fetchResponse(response);
    } on SocketException {
      throw "No Internet Connection";
    }
    return getJsonResponse;
  }

  @override
  Future sendPostApiResponse(String url, body) async {
    dynamic postJsonResponse;
    try {
      var response = await http.post(Uri.parse(url), body: jsonEncode(body));
      postJsonResponse = fetchResponse(response);
    } on SocketException {
      throw "No Internet Connection";
    }
    return postJsonResponse;
  }

  dynamic fetchResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var data = jsonDecode(response.body);
        return data;
      case 400:
        throw "Error While Communicating ${response.statusCode}";
      case 401:
        throw "Error While Communicating ${response.statusCode}";
      case 500:
        throw "Error While Communicating ${response.statusCode}";
    }
  }
}
