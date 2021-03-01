import 'package:flutter/material.dart';
import 'package:flutter_web/router/application.dart';

class Demo extends StatefulWidget {
  @override
  _Demo createState() => _Demo();
}

class _Demo extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo'), centerTitle: true),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: goToNavigator,
              child: Text('路由跳转传参数'),
            )
          ],
        ),
        
      ),
    );
  }

  goToNavigator() {
    $Router.router.navigateTo(context, '/receiveParams');
  }
}
