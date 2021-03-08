import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_nuggets/store/baseStore.dart';
import 'package:provider/provider.dart';

class MobxDemo extends StatefulWidget {
  @override
  _MobxDemo createState() => _MobxDemo();
}

class _MobxDemo extends State<MobxDemo> {
  BaseStore baseStore = BaseStore();

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('mobx Demo'),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          return Column(
            children: [
              RaisedButton(onPressed: onPressed),
              Text(baseStore.netStatus)
            ],
          );
        },
      ),
    );
  }
}
