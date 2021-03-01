import 'package:fluro/fluro.dart';
import './routeHandlers.dart';

class Routes {
  //首页
  static String root = '/';
  //启动屏
  static String splash = '/splash';
  // demo页
  static String demo = '/demo';
  static String receiveParams = '/receiveParams';
  static void configureRoutes(FluroRouter router) {
    router.define(root, handler: rootHandler);
    router.define(splash, handler: splashRouterHandler);
    router.define(demo, handler: demoHandler);
    router.define(receiveParams, handler: receiveHandler);
  }
}
