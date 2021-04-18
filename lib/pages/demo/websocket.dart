import 'dart:io';

import 'package:flutter/material.dart';
import '../../utils/websocket.dart';
import 'dart:convert';
import 'dart:typed_data';

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
      print('订阅信息>>,${res}');
      if (res is Uint8List) {
        var zipData = GZipCodec().decode(res);
        String result = utf8.decode(zipData, allowMalformed: true);
        var data = json.decode(result);
        print('订阅信息>>2,$result ');
      }
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
