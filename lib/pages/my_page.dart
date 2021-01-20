import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shengguo/services/http_service.dart';
import 'package:shengguo/services/memberStorage.dart';
import 'package:shengguo/services/screenAdapter.dart';

import 'package:dio/dio.dart';
import '../widget/iconFontWidget.dart';
import '../config/http_config.dart';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import '../services/memberStorage.dart';

class MyPage extends StatefulWidget {
  _MyPage createState() => _MyPage();
}

class _MyPage extends State<MyPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getMemberData();
  }

  _getMemberData() async {
    // HttpRequest.request(
    //   "api/member/profit_info",
    // ).then((res) {
    //   print(res);
    // });R
    // Future fetchNews({String type = ''}) async {
    //   await HttpRequest.get(
    //       path: 'https://zf.xianlady.com/api/member/profit_info',
    //       data: {'type': 'type'});
    // }

    // HttpRequest.request("https://zf.xianlady.com/api/member/profit_info",
    //     params: {"name": "why", 'age': 18}).then((res) {
    //   print(res);
    // });

    // HttpRequest.request("api/member/profit_info", method: "get", params: {})
    //     .then((res) {
    //   print(res);
    // });

    // HttpRequest.request("https://httpbin.org/post",
    //     method: "post", params: {"name": "why", 'age': 18}).then((res) {
    //   print(res);
    // });

    // Options options = Options(headers: {
    //   'version': 'v2',
    //   'token': await ManberServices.getTokenData(),
    // });
    // var apiUrl = "${config.base_url}api/member/profit_info";
    // Response response;
    // Dio dio = Dio();
    // response = await dio.get(apiUrl, options: options);
    // print(response.data['data']);
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    // MediaQuery.removePadding(
    //     removeTop: true, context: context, child: Scaffold());
    // MediaQuery.removePadding(context,context,child:Scaffold(),removeTop: true)
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 66, 65, 1.0),
      body: ListView(
        children: <Widget>[
          // 顶部区域
          Container(
            height: ScreenAdapter.height(468),
            width: ScreenAdapter.width(750),
            padding: EdgeInsets.fromLTRB(
              ScreenAdapter.width(22),
              ScreenAdapter.width(80),
              ScreenAdapter.width(22),
              ScreenAdapter.width(20),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/mytopbg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.only(
                          left: ScreenAdapter.width(40),
                          right: ScreenAdapter.width(14),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/icon/icon_jingdong.png',
                            fit: BoxFit.cover,
                            width: ScreenAdapter.width(125),
                            height: ScreenAdapter.width(125),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/setting');
                      },
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          right: ScreenAdapter.width(22),
                        ),
                        child: InkWell(
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "隔壁老王",
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1.0),
                                    fontSize: ScreenAdapter.size(32),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/kefu');
                                  },
                                  child: Icon(
                                    IconfontsWidget.kefu,
                                    color: Color.fromRGBO(255, 255, 255, 1.0),
                                    size: ScreenAdapter.size(44),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/setting');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: ScreenAdapter.height(80),
                  padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(40),
                    ScreenAdapter.width(0),
                    ScreenAdapter.width(20),
                    ScreenAdapter.width(0),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "提现数据",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "我要提现",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: ScreenAdapter.width(706),
                  height: ScreenAdapter.height(155),
                  padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(50),
                    ScreenAdapter.width(0),
                    ScreenAdapter.width(50),
                    ScreenAdapter.width(0),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      ScreenAdapter.width(25),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(
                                bottom: ScreenAdapter.width(24),
                              ),
                              child: Text(
                                "累计收益（元）",
                                style: TextStyle(
                                  color: Color.fromRGBO(51, 51, 51, 1.0),
                                  fontSize: ScreenAdapter.width(28),
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                '50',
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 76, 65, 1.0),
                                  fontSize: ScreenAdapter.width(34),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(
                                bottom: ScreenAdapter.width(24),
                              ),
                              child: Text(
                                "即将到账（元）",
                                style: TextStyle(
                                  color: Color.fromRGBO(51, 51, 51, 1.0),
                                  fontSize: ScreenAdapter.width(28),
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                '50',
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 76, 65, 1.0),
                                  fontSize: ScreenAdapter.width(34),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                  bottom: ScreenAdapter.width(24),
                                ),
                                child: Text(
                                  "可提现（元）",
                                  style: TextStyle(
                                    color: Color.fromRGBO(51, 51, 51, 1.0),
                                    fontSize: ScreenAdapter.width(28),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  '50',
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 76, 65, 1.0),
                                    fontSize: ScreenAdapter.width(34),
                                  ),
                                ),
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/cashOut');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                // 订单区域
                Container(
                  height: ScreenAdapter.height(242),
                  width: ScreenAdapter.width(706),
                  margin: EdgeInsets.only(
                    left: ScreenAdapter.width(22),
                    right: ScreenAdapter.width(22),
                    bottom: ScreenAdapter.width(20),
                  ),
                  padding: EdgeInsets.only(
                    top: ScreenAdapter.width(35),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      ScreenAdapter.width(25),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: ScreenAdapter.width(35),
                            padding: EdgeInsets.only(
                              left: ScreenAdapter.width(22),
                            ),
                            child: Text(
                              "我的订单",
                              style: TextStyle(
                                color: Color.fromRGBO(51, 51, 51, 1.0),
                                fontSize: ScreenAdapter.size(26),
                              ),
                            ),
                          ),
                          Container(
                            height: ScreenAdapter.width(35),
                            padding: EdgeInsets.only(
                              right: ScreenAdapter.width(38),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "查看全部",
                                    style: TextStyle(
                                      color: Color.fromRGBO(153, 153, 153, 1.0),
                                      fontSize: ScreenAdapter.size(24),
                                    ),
                                  ),
                                  Icon(
                                    IconfontsWidget.jiantouright,
                                    color: Color.fromRGBO(153, 153, 153, 1.0),
                                    size: ScreenAdapter.size(24),
                                  ),
                                ]),
                          )
                        ],
                      ),
                      Container(
                        width: ScreenAdapter.width(706),
                        height: ScreenAdapter.height(150),
                        padding: EdgeInsets.only(
                          top: ScreenAdapter.width(20),
                          bottom: ScreenAdapter.width(20),
                          left: ScreenAdapter.width(44),
                          right: ScreenAdapter.width(44),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              width: ScreenAdapter.width(150),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    "/order",
                                    arguments: {
                                      "type": 2,
                                    },
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: ScreenAdapter.height(15),
                                      ),
                                      child: Image.asset(
                                        'assets/icon/order1.png',
                                        fit: BoxFit.cover,
                                        width: ScreenAdapter.width(50),
                                        height: ScreenAdapter.width(50),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        '全部订单',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(51, 51, 51, 1.0),
                                          fontSize: ScreenAdapter.width(24),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: ScreenAdapter.width(150),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                      bottom: ScreenAdapter.height(15),
                                    ),
                                    child: Image.asset(
                                      'assets/icon/order2.png',
                                      fit: BoxFit.cover,
                                      width: ScreenAdapter.width(50),
                                      height: ScreenAdapter.width(50),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '即将到账',
                                      style: TextStyle(
                                        color: Color.fromRGBO(51, 51, 51, 1.0),
                                        fontSize: ScreenAdapter.width(24),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: ScreenAdapter.width(150),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                      bottom: ScreenAdapter.height(15),
                                    ),
                                    child: Image.asset(
                                      'assets/icon/order3.png',
                                      fit: BoxFit.cover,
                                      width: ScreenAdapter.width(50),
                                      height: ScreenAdapter.width(50),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '已到账',
                                      style: TextStyle(
                                        color: Color.fromRGBO(51, 51, 51, 1.0),
                                        fontSize: ScreenAdapter.width(24),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: ScreenAdapter.width(150),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                      bottom: ScreenAdapter.height(15),
                                    ),
                                    child: Image.asset(
                                      'assets/icon/order4.png',
                                      fit: BoxFit.cover,
                                      width: ScreenAdapter.width(50),
                                      height: ScreenAdapter.width(50),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '无效订单',
                                      style: TextStyle(
                                        color: Color.fromRGBO(51, 51, 51, 1.0),
                                        fontSize: ScreenAdapter.width(24),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // 轮播图
                Container(
                  width: ScreenAdapter.width(706),
                  height: ScreenAdapter.height(167),
                  margin: EdgeInsets.only(
                    left: ScreenAdapter.width(22),
                    right: ScreenAdapter.width(22),
                    bottom: ScreenAdapter.width(20),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      ScreenAdapter.width(25),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  // AspectRatio 配置轮播图宽高比
                  child: AspectRatio(
                    aspectRatio: 706 / 167,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return new Image.network(
                          'https://zf.xianlady.com/uploads/article/model/202005/29/20200529170632654212750.png',
                          fit: BoxFit.fill,
                        );
                      },
                      itemCount: 1, //轮播图个数
                      // pagination: new SwiperPagination(), //分页器
                      autoplay: false, //是否自动轮播
                    ),
                  ),
                ),
                // 底部菜单
                Container(
                  height: ScreenAdapter.height(336),
                  width: ScreenAdapter.width(706),
                  margin: EdgeInsets.only(
                    left: ScreenAdapter.width(22),
                    right: ScreenAdapter.width(22),
                    bottom: ScreenAdapter.width(20),
                  ),
                  padding: EdgeInsets.only(
                    top: ScreenAdapter.width(20),
                    bottom: ScreenAdapter.width(20),
                    left: ScreenAdapter.width(44),
                    right: ScreenAdapter.width(44),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      ScreenAdapter.width(25),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: ScreenAdapter.height(138),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              width: ScreenAdapter.width(150),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/commonProblem');
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: ScreenAdapter.height(15),
                                      ),
                                      child: Image.asset(
                                        'assets/icon/mymenu1.png',
                                        fit: BoxFit.cover,
                                        width: ScreenAdapter.width(50),
                                        height: ScreenAdapter.width(50),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        '常见问题',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(51, 51, 51, 1.0),
                                          fontSize: ScreenAdapter.width(24),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: ScreenAdapter.width(150),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/notice');
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: ScreenAdapter.height(15),
                                      ),
                                      child: Image.asset(
                                        'assets/icon/mymenu2.png',
                                        fit: BoxFit.cover,
                                        width: ScreenAdapter.width(50),
                                        height: ScreenAdapter.width(50),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        '官方公告',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(51, 51, 51, 1.0),
                                          fontSize: ScreenAdapter.width(24),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: ScreenAdapter.width(150),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/kefu');
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: ScreenAdapter.height(15),
                                      ),
                                      child: Image.asset(
                                        'assets/icon/mymenu3.png',
                                        fit: BoxFit.cover,
                                        width: ScreenAdapter.width(50),
                                        height: ScreenAdapter.width(50),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        '联系客服',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(51, 51, 51, 1.0),
                                          fontSize: ScreenAdapter.width(24),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: ScreenAdapter.width(150),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/suggestions');
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: ScreenAdapter.height(15),
                                      ),
                                      child: Image.asset(
                                        'assets/icon/mymenu4.png',
                                        fit: BoxFit.cover,
                                        width: ScreenAdapter.width(50),
                                        height: ScreenAdapter.width(50),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        '投诉建议',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(51, 51, 51, 1.0),
                                          fontSize: ScreenAdapter.width(24),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: ScreenAdapter.height(138),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              width: ScreenAdapter.width(150),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/collection');
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: ScreenAdapter.height(15),
                                      ),
                                      child: Image.asset(
                                        'assets/icon/mymenu5.png',
                                        fit: BoxFit.cover,
                                        width: ScreenAdapter.width(50),
                                        height: ScreenAdapter.width(50),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        '收藏',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(51, 51, 51, 1.0),
                                          fontSize: ScreenAdapter.width(24),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: ScreenAdapter.width(150),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/myFans');
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: ScreenAdapter.height(15),
                                      ),
                                      child: Image.asset(
                                        'assets/icon/mymenu6.png',
                                        fit: BoxFit.cover,
                                        width: ScreenAdapter.width(50),
                                        height: ScreenAdapter.width(50),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        '我的粉丝',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(51, 51, 51, 1.0),
                                          fontSize: ScreenAdapter.width(24),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: ScreenAdapter.width(150),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/invite');
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: ScreenAdapter.height(15),
                                      ),
                                      child: Image.asset(
                                        'assets/icon/mymenu7.png',
                                        fit: BoxFit.cover,
                                        width: ScreenAdapter.width(50),
                                        height: ScreenAdapter.width(50),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        ' 邀请赚钱 ',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(51, 51, 51, 1.0),
                                          fontSize: ScreenAdapter.width(24),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: ScreenAdapter.width(150),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/setting');
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: ScreenAdapter.height(15),
                                      ),
                                      child: Image.asset(
                                        'assets/icon/mymenu8.png',
                                        fit: BoxFit.cover,
                                        width: ScreenAdapter.width(50),
                                        height: ScreenAdapter.width(50),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        ' 设置 ',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(51, 51, 51, 1.0),
                                          fontSize: ScreenAdapter.width(24),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
