import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_nuggets/store/baseStore.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_nuggets/router/application.dart';
import 'package:flutter_nuggets/router/router.dart';
import 'package:flutter_nuggets/pages/home/home.dart';
import 'package:flutter_nuggets/pages/demo/demo.dart';
import 'package:flutter_nuggets/pages/demo/mobx.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
      builder: EasyLoading.init(),
    );
  }
}
