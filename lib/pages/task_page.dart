import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shengguo/services/screenAdapter.dart';
import 'package:shengguo/widget/iconFontWidget.dart';

class TaskPage extends StatefulWidget {
  _TaskPage createState() => _TaskPage();
}

class _TaskPage extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          // 头部区域
          Container(
            height: ScreenAdapter.height(670),
            width: ScreenAdapter.width(750),
            padding: EdgeInsets.only(
              top: ScreenAdapter.width(40),
              bottom: ScreenAdapter.width(20),
              left: ScreenAdapter.width(30),
              right: ScreenAdapter.width(30),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/mytaskbg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: ScreenAdapter.height(66),
                  padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(0),
                    ScreenAdapter.width(0),
                    ScreenAdapter.width(0),
                    ScreenAdapter.width(0),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "任务",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "规则",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: ScreenAdapter.width(30),
                    left: ScreenAdapter.width(76),
                    right: ScreenAdapter.width(76),
                    bottom: ScreenAdapter.width(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "累计金币收益",
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1.0),
                                  fontSize: ScreenAdapter.width(30),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                top: ScreenAdapter.width(30),
                                bottom: ScreenAdapter.width(30),
                              ),
                              child: Text(
                                '1000',
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1.0),
                                  fontSize: ScreenAdapter.width(48),
                                ),
                              ),
                            ),
                            Container(
                              height: ScreenAdapter.height(48),
                              width: ScreenAdapter.width(180),
                              child: RaisedButton(
                                color: Color.fromRGBO(255, 255, 255, 0.2),
                                onPressed: () {
                                  print('兑换明细');
                                },
                                elevation: 0,
                                child: Text(
                                  '兑换明细',
                                  style: TextStyle(
                                    fontSize: ScreenAdapter.size(28),
                                    color: Color.fromRGBO(255, 255, 255, 1.0),
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(48),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "当前金币余额",
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1.0),
                                  fontSize: ScreenAdapter.width(30),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                top: ScreenAdapter.width(30),
                                bottom: ScreenAdapter.width(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: ScreenAdapter.width(5),
                                    ),
                                    child: Icon(
                                      IconfontsWidget.jiangxu,
                                      color: Color.fromRGBO(51, 51, 51, 1.0),
                                      size: ScreenAdapter.size(48),
                                    ),
                                  ),
                                  Text(
                                    "50",
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1.0),
                                      fontSize: ScreenAdapter.size(48),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: ScreenAdapter.height(48),
                              width: ScreenAdapter.width(180),
                              child: RaisedButton(
                                color: Color.fromRGBO(255, 255, 255, 0.2),
                                onPressed: () {
                                  print('我要兑换');
                                },
                                elevation: 0,
                                child: Text(
                                  '我要兑换',
                                  style: TextStyle(
                                    fontSize: ScreenAdapter.size(28),
                                    color: Color.fromRGBO(255, 255, 255, 1.0),
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(48),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // 签到区域
                Container(
                  width: ScreenAdapter.width(706),
                  height: ScreenAdapter.height(300),
                  padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(20),
                    ScreenAdapter.width(20),
                    ScreenAdapter.width(20),
                    ScreenAdapter.width(20),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      ScreenAdapter.width(25),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                      bottom: ScreenAdapter.height(20),
                                    ),
                                    child: Text(
                                      '已连续签到1天',
                                      style: TextStyle(
                                        color: Color.fromRGBO(51, 51, 51, 1.0),
                                        fontSize: ScreenAdapter.size(34),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '签到有更多惊喜哦',
                                      style: TextStyle(
                                        color:
                                            Color.fromRGBO(102, 102, 102, 1.0),
                                        fontSize: ScreenAdapter.size(26),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: ScreenAdapter.height(58),
                              width: ScreenAdapter.width(168),
                              margin: EdgeInsets.only(
                                right: ScreenAdapter.width(20),
                              ),
                              child: RaisedButton(
                                color: Color.fromRGBO(255, 66, 65, 1.0),
                                onPressed: () {
                                  print('我要兑换');
                                },
                                elevation: 0,
                                child: Text(
                                  '签到',
                                  style: TextStyle(
                                    fontSize: ScreenAdapter.size(28),
                                    color: Color.fromRGBO(255, 255, 255, 1.0),
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(58),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: ScreenAdapter.height(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: ScreenAdapter.width(80),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                      bottom: ScreenAdapter.height(10),
                                    ),
                                    child: Image.asset(
                                      'assets/icon/mymenu5.png',
                                      fit: BoxFit.cover,
                                      width: ScreenAdapter.width(64),
                                      height: ScreenAdapter.width(64),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      ' 第一天',
                                      style: TextStyle(
                                        color: Color.fromRGBO(51, 51, 51, 1.0),
                                        fontSize: ScreenAdapter.width(22),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: ScreenAdapter.width(80),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                      bottom: ScreenAdapter.height(10),
                                    ),
                                    child: Image.asset(
                                      'assets/icon/mymenu5.png',
                                      fit: BoxFit.cover,
                                      width: ScreenAdapter.width(64),
                                      height: ScreenAdapter.width(64),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      ' 第一天',
                                      style: TextStyle(
                                        color: Color.fromRGBO(51, 51, 51, 1.0),
                                        fontSize: ScreenAdapter.width(22),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: ScreenAdapter.width(80),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                      bottom: ScreenAdapter.height(10),
                                    ),
                                    child: Image.asset(
                                      'assets/icon/mymenu5.png',
                                      fit: BoxFit.cover,
                                      width: ScreenAdapter.width(64),
                                      height: ScreenAdapter.width(64),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      ' 第一天',
                                      style: TextStyle(
                                        color: Color.fromRGBO(51, 51, 51, 1.0),
                                        fontSize: ScreenAdapter.width(22),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: ScreenAdapter.width(80),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                      bottom: ScreenAdapter.height(10),
                                    ),
                                    child: Image.asset(
                                      'assets/icon/mymenu5.png',
                                      fit: BoxFit.cover,
                                      width: ScreenAdapter.width(64),
                                      height: ScreenAdapter.width(64),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      ' 第一天',
                                      style: TextStyle(
                                        color: Color.fromRGBO(51, 51, 51, 1.0),
                                        fontSize: ScreenAdapter.width(22),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: ScreenAdapter.width(80),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                      bottom: ScreenAdapter.height(10),
                                    ),
                                    child: Image.asset(
                                      'assets/icon/mymenu5.png',
                                      fit: BoxFit.cover,
                                      width: ScreenAdapter.width(64),
                                      height: ScreenAdapter.width(64),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      ' 第一天',
                                      style: TextStyle(
                                        color: Color.fromRGBO(51, 51, 51, 1.0),
                                        fontSize: ScreenAdapter.width(22),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: ScreenAdapter.width(80),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                      bottom: ScreenAdapter.height(10),
                                    ),
                                    child: Image.asset(
                                      'assets/icon/mymenu5.png',
                                      fit: BoxFit.cover,
                                      width: ScreenAdapter.width(64),
                                      height: ScreenAdapter.width(64),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      ' 第一天',
                                      style: TextStyle(
                                        color: Color.fromRGBO(51, 51, 51, 1.0),
                                        fontSize: ScreenAdapter.width(22),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: ScreenAdapter.width(80),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                      bottom: ScreenAdapter.height(10),
                                    ),
                                    child: Image.asset(
                                      'assets/icon/mymenu5.png',
                                      fit: BoxFit.cover,
                                      width: ScreenAdapter.width(64),
                                      height: ScreenAdapter.width(64),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      ' 第一天',
                                      style: TextStyle(
                                        color: Color.fromRGBO(51, 51, 51, 1.0),
                                        fontSize: ScreenAdapter.width(22),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // 底部任务区域
          Container(
            width: ScreenAdapter.width(690),
            margin: EdgeInsets.only(
              left: ScreenAdapter.width(30),
              right: ScreenAdapter.width(30),
              bottom: ScreenAdapter.width(30),
            ),
            padding: EdgeInsets.only(
              left: ScreenAdapter.width(30),
              right: ScreenAdapter.width(30),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                ScreenAdapter.width(25),
              ),
              color: Color.fromRGBO(255, 255, 255, 1.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: ListTile(
                    title: Text(
                      "来坐任务",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1.0),
                        fontSize: ScreenAdapter.size(34),
                      ),
                    ),
                    subtitle: Text(
                      "复制链接",
                      style: TextStyle(
                        color: Color.fromRGBO(102, 102, 102, 1.0),
                        fontSize: ScreenAdapter.size(26),
                      ),
                    ),
                    contentPadding: EdgeInsets.only(
                      top: ScreenAdapter.width(13),
                      bottom: ScreenAdapter.width(13),
                    ),
                    trailing: Container(
                      height: ScreenAdapter.height(60),
                      width: ScreenAdapter.width(180),
                      child: RaisedButton(
                        color: Color.fromRGBO(255, 66, 65, 1.0),
                        onPressed: () {
                          print('去完成');
                        },
                        elevation: 0,
                        child: Text(
                          '去完成',
                          style: TextStyle(
                            fontSize: ScreenAdapter.size(28),
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(60),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Color.fromRGBO(220, 220, 220, 1.0),
                  height: 0,
                ),
                Container(
                  child: ListTile(
                    title: Text(
                      "来坐任务",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1.0),
                        fontSize: ScreenAdapter.size(34),
                      ),
                    ),
                    subtitle: Text(
                      "复制链接",
                      style: TextStyle(
                        color: Color.fromRGBO(102, 102, 102, 1.0),
                        fontSize: ScreenAdapter.size(26),
                      ),
                    ),
                    contentPadding: EdgeInsets.only(
                      top: ScreenAdapter.width(13),
                      bottom: ScreenAdapter.width(13),
                    ),
                    trailing: Container(
                      height: ScreenAdapter.height(60),
                      width: ScreenAdapter.width(180),
                      child: RaisedButton(
                        color: Color.fromRGBO(255, 66, 65, 1.0),
                        onPressed: () {
                          print('去完成');
                        },
                        elevation: 0,
                        child: Text(
                          '去完成',
                          style: TextStyle(
                            fontSize: ScreenAdapter.size(28),
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(60),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Color.fromRGBO(220, 220, 220, 1.0),
                  height: 0,
                ),
                Container(
                  child: ListTile(
                    title: Text(
                      "来坐任务",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1.0),
                        fontSize: ScreenAdapter.size(34),
                      ),
                    ),
                    subtitle: Text(
                      "复制链接",
                      style: TextStyle(
                        color: Color.fromRGBO(102, 102, 102, 1.0),
                        fontSize: ScreenAdapter.size(26),
                      ),
                    ),
                    contentPadding: EdgeInsets.only(
                      top: ScreenAdapter.width(13),
                      bottom: ScreenAdapter.width(13),
                    ),
                    trailing: Container(
                      height: ScreenAdapter.height(60),
                      width: ScreenAdapter.width(180),
                      child: RaisedButton(
                        color: Color.fromRGBO(255, 66, 65, 1.0),
                        onPressed: () {
                          print('去完成');
                        },
                        elevation: 0,
                        child: Text(
                          '去完成',
                          style: TextStyle(
                            fontSize: ScreenAdapter.size(28),
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(60),
                          ),
                        ),
                      ),
                    ),
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
