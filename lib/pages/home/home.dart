import 'package:flutter/material.dart';
import 'package:flutter_nuggets/api/http.dart';
import 'package:flutter_nuggets/model/popular.dart';
import 'package:flutter_nuggets/model/backend.dart';
import 'package:flutter_nuggets/utils/platform.dart';
import 'package:flutter_nuggets/store/baseStore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_nuggets/components/com/publicLoading.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController = ScrollController();
  List nav = <Widget>[
    Tab(text: '推荐'),
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
  String cursor = '0';
  List likeList = [];
  var initialIndex = 0;
  var activeTabBarIndex = 0;
  var loadingStatus = 'nomal';
  BaseStore baseStore = BaseStore();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
    getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑到了最底部');
        getMore();
      }
    });
    activeTabBarIndex = initialIndex;
    // 全局loading
    EasyLoading.show(status: 'loading...');
    Future.delayed(Duration(seconds: 2), () {
      EasyLoading.dismiss();
    });
  }

  void getData() {
    switch (activeTabBarIndex) {
      case 0:
        getPopular();
        break;
      case 1:
        Future.delayed(Duration(seconds: 1), () {
          getBackEnd();
        });
        break;
      case 2:
        Future.delayed(Duration(seconds: 1), () {
          getBackEnd();
        });
        break;
      default:
    }
  }

  void getMore() {
    cursor = 'eyJ2IjoiNjkzNTIyNjYxNDAyMDA0Njg3OCIsImkiOjQwfQ';
    getData();
  }

  int getIcon(index) {
    if (activeIconIndex == index) return 0xe60c;
    return 0xe601;
  }

  Widget _renderRow(BuildContext context, int index) {
    var user_name = null;
    var title = null;
    var digg_count = null;
    var comment_count = null;
    if (detailList.length == 0) return null;
    if (activeTabBarIndex == 0) {
      var item = Data.fromJson(detailList[index]);
      user_name = item.item_info?.author_user_info?.user_name ?? '--';
      title = item.item_info?.article_info?.title ?? '--';
      digg_count = item.item_info?.article_info?.digg_count ?? '--';
      comment_count = item.item_info?.article_info?.comment_count ?? '--';
    } else {
      var item = BackData.fromJson(detailList[index]);
      user_name = item?.author_user_info?.user_name ?? '--';
      title = item?.article_info?.title ?? '--';
      digg_count = item?.article_info?.digg_count ?? '--';
      comment_count = item?.article_info?.comment_count ?? '--';
    }

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
                child: Center(
                  child: Icon(
                    IconData(0xe764, fontFamily: 'iconfont'),
                    size: 16,
                  ),
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
      getData();
    });
  }

  List tabBarViewItem() {
    List arr = <Widget>[];
    for (var i = 0; i < nav.length; i++) {
      arr.add(RefreshIndicator(
        onRefresh: _onRefresh,
        color: Color(0xff007fff),
        child: ListView.separated(
            key: ObjectKey(i),
            itemBuilder: _renderRow,
            itemCount: detailList.length,
            controller: _scrollController,
            separatorBuilder: (BuildContext context, int index) =>
                Divider(height: 1.0, color: Color(0xffb2bac2))),
      ));
    }
    return arr;
  }

  void getBackEnd() async {
    Map data = {};
    switch (activeTabBarIndex) {
      case 1:
        data = {
          "id_type": 2,
          "sort_type": 200,
          "cate_id": "6809637767543259144",
          "cursor": "0",
          "limit": 20
        };
        break;
      case 2:
        data = {
          "id_type": 2,
          "sort_type": 200,
          "cate_id": "6809637769959178254",
          "cursor": "0",
          "limit": 20
        };
        break;
    }
    print('获取backend入参数${data}');
    var _data = await $http()
        .dio
        .post('/recommend_api/v1/article/recommend_cate_feed', data: data);
    List list = _data.data['data'];
    print('backend数据${_data.data['test']}');
    setState(() {
      detailList = list;
      loadingStatus = _data.data['netStatus'];
    });
  }

  void getPopular() async {
    Map data = {
      "client_type": 2608,
      "cursor": cursor,
      "id_type": 2,
      "limit": 20,
      "sort_type": 200
    };
    print('发起接口请求>>>${data}');
    var _data = await $http()
        .dio
        .post('/recommend_api/v1/article/recommend_all_feed', data: data);
    List list = _data.data['data'];
    list.removeAt(0);
    setState(() {
      detailList = list;
      loadingStatus = _data.data['netStatus'];
    });
  }

//当整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: this.nav.length,
        initialIndex: initialIndex,
        child: Scaffold(
          appBar: AppBar(
              title: Container(
                  height: 60.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround, //水平居中对齐
                    children: <Widget>[
                      Text(
                        '首页',
                        style:
                            TextStyle(color: Color(0xff007fff), fontSize: 16),
                      ),
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
                onTap: (int index) {
                  print('点击的tabar${index}');
                  activeTabBarIndex = index;
                  setState(() {
                    detailList = [];
                  });
                  getData();
                },
              )),
          body: PublicLoading(
              loadingStatus: loadingStatus,
              children: TabBarView(
                children: tabBarViewItem(),
              )),
        ));
  }
}
