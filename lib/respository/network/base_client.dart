abstract class BaseApi {
  Future<dynamic> fetchGetApiResponse(String url);
  Future<dynamic> sendPostApiResponse(String url, dynamic body);
}

