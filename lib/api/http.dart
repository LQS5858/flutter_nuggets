import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_nuggets/utils/platform.dart';
import 'package:flutter_nuggets/utils/common.dart';

class $http {
  final Dio dio = Dio();

  $http() {
    //api地
    dio.options.baseUrl =
        PlatformUtils.isWeb ? 'https://api.juejin.cn' : 'https://api.juejin.cn';
    // 请求超时时间
    dio.options.receiveTimeout = 30000;
    //拦截器
    dio.interceptors
      ..add(InterceptorsWrapper(onRequest: (RequestOptions options) {
        print('>>>request,${options}');
        // options.headers['token'] = null;
        return options;
      }, onResponse: (Response response) async {
        if (!PlatformUtils.isWeb) {
          var netStatus = await Common.checkNetWork();
          response.data['netStatus'] = netStatus;
        }
        return response.data;
      }, onError: (DioError error) {
        print('>>>httpError,${error}');
        return error;
      }))
      ..add(LogInterceptor());
  }
}
