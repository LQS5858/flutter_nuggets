import 'package:dio/dio.dart';
import 'dart:convert';

class $http {
  final Dio dio = Dio();

  $http() {
    //api地
    dio.options.baseUrl = 'https://api.juejin.cn';
    // 请求超时时间
    dio.options.receiveTimeout = 30000;
    //拦截器
    dio.interceptors
      ..add(InterceptorsWrapper(onRequest: (RequestOptions options) {
        print('>>>request,${options}');
        // options.headers['token'] = null;
        return options;
      }, onResponse: (Response response) {
        response.data['test'] = '9';
        return response.data;
      }, onError: (DioError error) {
        print('>>>httpError,${error}');
        return error;
      }))
      ..add(LogInterceptor());
  }
}
