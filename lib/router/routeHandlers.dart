import 'package:flutter/material.dart';
import 'package:flutter_web/pages/splash/splash.dart';
import 'package:flutter_web/pages/demo/demo.dart';
import 'package:flutter_web/pages/home/home.dart';
import 'package:flutter_web/pages/demo/receiveParams.dart';

import 'package:fluro/fluro.dart';

Handler rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Home();
});
Handler splashRouterHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Splash();
});
Handler demoHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Demo();
});
Handler receiveHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      
  return ReceiveParams(params);
});
