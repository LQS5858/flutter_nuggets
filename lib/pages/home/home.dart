import 'package:flutter/material.dart';
import 'package:flutter_web/api/http.dart';
import 'package:flutter_web/model/popular.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List nav = <Widget>[
    Tab(text: '推荐'),
    Tab(text: '关注'),
    Tab(text: '前端'),
    Tab(text: '后端'),
    Tab(text: 'Android'),
    Tab(text: 'ios'),
    Tab(text: '人工智能'),
    Tab(text: '开发工具'),
  ];
  List detailList = [];
  List navTwo = <Widget>[Tab(text: '热门'), Tab(text: '最新'), Tab(text: '热榜')];
  var iconType = 0xe601;
  int activeIconIndex = -1;
  List likeList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
    this.getPopular();
  }

  int getIcon(index) {
    if (activeIconIndex == index) return 0xe60c;
    return 0xe601;
  }

  Widget _renderRow(BuildContext context, int index) {
    var item = Data.fromJson(detailList[index]);
    var user_name = item.item_info.author_user_info?.user_name ?? '--';
    var title = item.item_info.article_info?.title ?? '--';
    var digg_count = item.item_info.article_info?.digg_count ?? '--';
    var comment_count = item.item_info.article_info?.comment_count ?? '--';
    return Container(
      padding: const EdgeInsets.only(top: 18, bottom: 18, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              user_name,
              style: TextStyle(color: Color(0xffb2bac2)),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 6, bottom: 12),
              child: Text(title)),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffedeeef), width: 0.5),
                  borderRadius: BorderRadius.circular(2),
                ),
                height: 22.0,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: InkWell(
                          child: Icon(
                            IconData(getIcon(index), fontFamily: 'iconfont'),
                            size: 16.0,
                          ),
                          onTap: () {
                            setState(() {
                              activeIconIndex = index;
                            });
                          },
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 15),
                          child: Text(digg_count.toString()))
                    ]),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffedeeef), width: 0.5),
                  borderRadius: BorderRadius.circular(2),
                ),
                height: 22.0,
                width: 55,
              )
            ],
          )
        ],
      ),
    );
  }

  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      print('refresh');
    });
  }

  void getPopular() async {
    Map data = {
      "client_type": 2608,
      "cursor": "0",
      "id_type": 2,
      "limit": 20,
      "sort_type": 200
    };
    var _data = await $http()
        .dio
        .post('/recommend_api/v1/article/recommend_all_feed', data: data);
    print('数据${_data.data['data']}');
    List list = _data.data['data'];
    list.removeAt(0);
    setState(() {
      detailList = list;
    });
  }

//当整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: this.nav.length,
        child: Scaffold(
          appBar: AppBar(
              title: Container(
                  height: 60.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround, //水平居中对齐
                    children: <Widget>[
                      Text('首页'),
                      Container(
                          width: 122.0,
                          child: TextField(
                            decoration: InputDecoration(
                              isCollapsed: true,
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              enabledBorder: OutlineInputBorder(
                                /*边角*/
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0), //边角为30
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xffE6E6E7), //边线颜色为黄色
                                  width: 1, //边线宽度为2
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.green, //边框颜色为绿色
                                width: 1, //宽度为5
                              )),
                            ),
                          )),
                      Icon(
                        Icons.notifications,
                        size: 30,
                        color: Color(0xff71777c),
                        textDirection: TextDirection.ltr,
                      ),
                      Image(
                          width: 30,
                          height: 30,
                          image: NetworkImage(
                              "https://sf3-ttcdn-tos.pstatp.com/img/mosaic-legacy/3796/2975850990~300x300.image"))
                    ],
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Color(0xfff1f1f1))))),
              centerTitle: true,
              bottom: TabBar(
                unselectedLabelColor: Color(0xff909090),
                labelColor: Color(0xff007fff),
                isScrollable: true,
                tabs: this.nav,
              )),
          body: TabBarView(
            children: [
              RefreshIndicator(
                onRefresh: _onRefresh,
                child: ListView.separated(
                    itemBuilder: _renderRow,
                    itemCount: detailList.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(height: 1.0, color: Color(0xffb2bac2))),
              ),
              Text('测试'),
              Text('测试'),
              Text('测试'),
              Text('测试'),
              Text('测试'),
              Text('测试'),
              Text('测试')
            ],
          ),
        ));
  }
}
