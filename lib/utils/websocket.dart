import 'dart:async';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import '../config/constants.dart';

class Ws {
  var ws = WebSocketChannel.connect(Uri.parse(Constants.socket));
  Timer timer;
  Ws() {
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) {
      ws.sink.add('ping');
      print('发送ping');
    });
  }
  void subscribe(cmd) {
    ws.sink.add(cmd);
  }

  void reConnect() {}
  void onMessage(callback) {
    ws.stream.listen((message) {
      callback(message);
    }, onError: (err) {
      print('发生错误,${err}');
    });
  }

  void unSubscribe(uncmd) {
    ws.sink.add(uncmd);
  }

  void close() {
    ws.sink.close();
  }
}
