import 'package:flutter/material.dart';
import '../../utils/websocket.dart';
import 'dart:convert' as convert;

class SocketDemo extends StatefulWidget {
  @override
  _SocketDemo createState() => _SocketDemo();
}

class _SocketDemo extends State<SocketDemo> {
  final Ws ws = Ws();

  @override
  void initState() {
    super.initState();
    var str = '{"cmd": "sub.rate", "args": []}';
    ws.subscribe(str);
    print('打印发送参数,${str}');
    ws.onMessage((res) {
      print('订阅返回信息,${res}');
    });
  }

  @override
  void dispose() {
    super.dispose();
    ws.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('websocket Demo'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('socket订阅信息'),
      ),
    );
  }
}
