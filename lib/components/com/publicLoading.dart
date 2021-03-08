import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PublicLoading extends StatefulWidget {
  /*
   * @params
   * loadingStatus 枚举值 noData无数据，noNetwork无网络 show打开loading
   * children  子组件widget
   */
  String loadingStatus;
  Widget children;
  PublicLoading({Key key, @required this.loadingStatus, this.children})
      : super(key: key);
  @override
  _PublicLoading createState() => _PublicLoading();
}

class _PublicLoading extends State<PublicLoading> {
  /*
    * @params{
     *String loadingStatus  noData 无数据 noNetwork 无网络 loading  开启loading
     *
   }
    */
  @override
  void initState() {
    super.initState();
  }

  Widget getWidget() {
    switch (widget.loadingStatus) {
      case 'noData':
        return Container(
          child: Text('无数据'),
        );

        break;
      case 'noNetwork':
        return Container(
          child: Text('无网络'),
        );
      case 'loading':
        return Stack(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 35.0),
              child: new Center(
                child: SpinKitFadingCircle(
                  color: Colors.blueAccent,
                  size: 30.0,
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
              child: new Center(
                child: new Text('正在加载中，莫着急哦~'),
              ),
            ),
          ],
        );
      default:
        return Container(
          child: widget.children,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return getWidget();
  }
}
