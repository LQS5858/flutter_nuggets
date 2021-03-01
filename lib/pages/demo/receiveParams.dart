import 'package:flutter/material.dart';

class ReceiveParams extends StatelessWidget {
  ReceiveParams(params) {
    print('>>>参数,${params.url}');
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('接收参数'),
          centerTitle: true,
        ),
        body: Container());
  }
}
