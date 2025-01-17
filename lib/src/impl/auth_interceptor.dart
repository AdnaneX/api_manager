import 'package:api_manager/api_manager.dart';
import 'package:dio/dio.dart';

/// Created by Taohid on 02, March, 2020
/// Email: taohid32@gmail.com

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._authTokenListener);

  AuthTokenListener _authTokenListener;

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (options != null &&
        options.headers.containsKey("isAuthRequired") &&
        options.headers["isAuthRequired"]) {
      if (_authTokenListener != null) {
        options.headers.remove("isAuthRequired");
        String token = await _authTokenListener();
        options.headers.addAll({
          "Authorization": token,
        });
        return options;
      } else {
        print(
            '!!!! isAuthRequired is true for this request. But setAuthToken function not define in api manager, Ignoring auth token for request !!!!');
        return options?.cancelToken?.cancel();
      }
    }
  }
}
