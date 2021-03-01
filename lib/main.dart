import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web/store/baseStore.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_web/router/application.dart';
import 'package:flutter_web/router/router.dart';
import 'package:flutter_web/pages/home/home.dart';
import 'package:flutter_web/pages/demo/demo.dart';

void main() {
  // 修改系统栏颜色
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xffffffff),
      statusBarColor: Color(0xffffffff)));
  runApp(MultiProvider(
    providers: [Provider<BaseStore>(create: (_) => BaseStore())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp() {
    final router = new FluroRouter();
    Routes.configureRoutes(router);
    $Router.router = router;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '仿掘金',
      theme: ThemeData(
          primaryColor: Color(0xffffffff),
          accentColor: Color(0xffffffff),
          scaffoldBackgroundColor: Color(0xffffffff)),
      home: Home(),
      onGenerateRoute: $Router.router.generator,
    );
  }
}
