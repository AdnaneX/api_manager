import 'package:api_manager/api_manager.dart';

void main() async {
  ApiManager _apiManager = ApiManager();
  _apiManager.options.baseUrl = 'https://example.com';
  _apiManager.responseBodyWrapper("data");

  ApiResponse<List<dynamic>> response = await _apiManager.request(
    requestType: RequestType.GET,
    route: '/post/1',
    responseBodySerializer: (jsonMap) {
      return jsonMap as List;
    },
  );
  print(response);
}
