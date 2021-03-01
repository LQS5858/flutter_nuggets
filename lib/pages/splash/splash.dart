import 'package:flutter/material.dart';
import 'package:flutter_web/pages/home/home.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPage();
  }
}

class _SplashPage extends State<Splash> {
  num _time = 6;
  Timer _timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/image_splash.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
        ),
        Positioned(
            top: 15.0,
            right: 15.0,
            child: GestureDetector(
              onTap: _goToHome,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(),
                child: Text('${_time}s跳过',
                    style: TextStyle(color: Colors.white, fontSize: 14.0)),
              ),
            ))
      ],
    ));
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        _time = _time - 1;
      });
      if (_time == 1) {
        _goToHome();
      }
    });
  }

  void _goToHome() {
    _timer.cancel();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Home()),
        (route) => route = null);
  }
}
