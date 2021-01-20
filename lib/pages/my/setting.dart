import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:shengguo/services/memberStorage.dart';
import 'package:shengguo/services/screenAdapter.dart';
import '../../widget/iconFontWidget.dart';

/// 自定义的设置选项组件。
class SettingOptions extends StatefulWidget {
  @override
  _SettingOptionsState createState() => _SettingOptionsState();
}

/// 与自定义的设置选项组件关联的状态子类。
class _SettingOptionsState extends State<SettingOptions> {
  Map settingData = {};
  void initState() {
    super.initState();
    //获取数据并渲染设置页面
    _getSettingData();
  }

  // 获取热门专题活动数据
  _getSettingData() async {
    setState(() async {
      settingData = await ManberServices.getMemberData();
      print(settingData);
    });
  }

  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "设置",
          style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1.0),
            fontSize: ScreenAdapter.width(36),
          ),
        ),
        leading: BackButton(
          color: Color.fromRGBO(51, 51, 51, 1.0),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
        elevation: 2,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: ScreenAdapter.height(108),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: ScreenAdapter.width(30),
                  ),
                  child: Expanded(
                    child: Text(
                      "头像",
                      style: TextStyle(
                        color: Color.fromRGBO(51, 51, 51, 1.0),
                        fontSize: ScreenAdapter.size(32),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: ScreenAdapter.width(30),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/icon/icon_jingdong.png',
                      fit: BoxFit.cover,
                      width: ScreenAdapter.width(90),
                      height: ScreenAdapter.width(90),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 0,
          ),
          Container(
            height: ScreenAdapter.height(108),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: ScreenAdapter.width(30),
                  ),
                  child: Expanded(
                    child: Text(
                      "昵称",
                      style: TextStyle(
                        color: Color.fromRGBO(51, 51, 51, 1.0),
                        fontSize: ScreenAdapter.size(32),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: ScreenAdapter.width(30),
                  ),
                  child: Expanded(
                    child: Text(
                      "l",
                      style: TextStyle(
                        color: Color.fromRGBO(153, 153, 153, 1.0),
                        fontSize: ScreenAdapter.size(32),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 0,
          ),
          Container(
            height: ScreenAdapter.height(88),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: ScreenAdapter.width(30),
                  ),
                  child: Expanded(
                    child: Text(
                      "团队管理微信",
                      style: TextStyle(
                        color: Color.fromRGBO(51, 51, 51, 1.0),
                        fontSize: ScreenAdapter.size(32),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        right: ScreenAdapter.width(22),
                      ),
                      child: Expanded(
                        child: Text(
                          "111",
                          style: TextStyle(
                            color: Color.fromRGBO(153, 153, 153, 1.0),
                            fontSize: ScreenAdapter.size(26),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: ScreenAdapter.width(30),
                      ),
                      child: Icon(
                        IconfontsWidget.jiantouright,
                        color: Color.fromRGBO(153, 153, 153, 1.0),
                        size: ScreenAdapter.size(30),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 0,
          ),
          Container(
            height: ScreenAdapter.height(88),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: ScreenAdapter.width(30),
                  ),
                  child: Expanded(
                    child: Text(
                      "用户ID",
                      style: TextStyle(
                        color: Color.fromRGBO(51, 51, 51, 1.0),
                        fontSize: ScreenAdapter.size(32),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        right: ScreenAdapter.width(22),
                      ),
                      child: Expanded(
                        child: Text(
                          "DSDF123",
                          style: TextStyle(
                            color: Color.fromRGBO(153, 153, 153, 1.0),
                            fontSize: ScreenAdapter.size(26),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: ScreenAdapter.width(30),
                      ),
                      child: Container(
                        height: ScreenAdapter.height(45),
                        width: ScreenAdapter.width(100),
                        child: OutlineButton(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(153, 153, 153, 1.0),
                            width: 1,
                          ),
                          textColor: Color.fromRGBO(153, 153, 153, 1.0),
                          padding: EdgeInsets.only(
                            right: ScreenAdapter.width(5),
                            left: ScreenAdapter.width(5),
                          ),
                          child: Text(
                            '复制',
                            style: TextStyle(
                              color: Color.fromRGBO(153, 153, 153, 1.0),
                              fontSize: ScreenAdapter.size(26),
                            ),
                          ),
                          onPressed: () {
                            print("这是一个普通按钮");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 0,
          ),
          Container(
            height: ScreenAdapter.height(26),
            width: double.infinity,
            color: Color.fromRGBO(249, 249, 249, 1.0),
          ),
          Divider(
            height: 0,
          ),
          Container(
            height: ScreenAdapter.height(88),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: ScreenAdapter.width(30),
                    right: ScreenAdapter.width(22),
                  ),
                  child: Icon(
                    IconfontsWidget.taobao,
                    color: Color.fromRGBO(223, 96, 59, 1.0),
                    size: ScreenAdapter.size(48),
                  ),
                ),
                Expanded(
                  child: Text(
                    "淘宝",
                    style: TextStyle(
                      color: Color.fromRGBO(51, 51, 51, 1.0),
                      fontSize: ScreenAdapter.size(32),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: ScreenAdapter.width(30),
                  ),
                  child: Expanded(
                    child: Text(
                      "葫芦娃",
                      style: TextStyle(
                        color: Color.fromRGBO(153, 153, 153, 1.0),
                        fontSize: ScreenAdapter.size(32),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 0,
          ),
          Container(
            height: ScreenAdapter.height(88),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: ScreenAdapter.width(30),
                    right: ScreenAdapter.width(22),
                  ),
                  child: Icon(
                    IconfontsWidget.shouji,
                    color: Color.fromRGBO(223, 96, 59, 1.0),
                    size: ScreenAdapter.size(48),
                  ),
                ),
                Expanded(
                  child: Text(
                    '手机号',
                    style: TextStyle(
                      color: Color.fromRGBO(51, 51, 51, 1.0),
                      fontSize: ScreenAdapter.size(32),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        right: ScreenAdapter.width(22),
                      ),
                      child: Expanded(
                        child: Text(
                          "13201441195",
                          style: TextStyle(
                            color: Color.fromRGBO(153, 153, 153, 1.0),
                            fontSize: ScreenAdapter.size(26),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: ScreenAdapter.width(30),
                      ),
                      child: Icon(
                        IconfontsWidget.jiantouright,
                        color: Color.fromRGBO(153, 153, 153, 1.0),
                        size: ScreenAdapter.size(30),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 0,
          ),
          Container(
            height: ScreenAdapter.height(26),
            width: double.infinity,
            color: Color.fromRGBO(249, 249, 249, 1.0),
          ),
          Divider(
            height: 0,
          ),
          Container(
            height: ScreenAdapter.height(88),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: ScreenAdapter.width(30),
                  ),
                  child: Expanded(
                    child: Text(
                      "清除缓存",
                      style: TextStyle(
                        color: Color.fromRGBO(51, 51, 51, 1.0),
                        fontSize: ScreenAdapter.size(32),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: ScreenAdapter.width(30),
                  ),
                  child: Text(
                    "3.59MB",
                    style: TextStyle(
                      color: Color.fromRGBO(153, 153, 153, 1.0),
                      fontSize: ScreenAdapter.size(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 0,
          ),
          Container(
            height: ScreenAdapter.height(88),
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: ScreenAdapter.width(30),
                    ),
                    child: Expanded(
                      child: Text(
                        "关于我们",
                        style: TextStyle(
                          color: Color.fromRGBO(51, 51, 51, 1.0),
                          fontSize: ScreenAdapter.size(32),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: ScreenAdapter.width(30),
                    ),
                    child: Icon(
                      IconfontsWidget.jiantouright,
                      color: Color.fromRGBO(153, 153, 153, 1.0),
                      size: ScreenAdapter.size(30),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, '/aboutUs');
              },
            ),
          ),
          Divider(
            height: 0,
          ),
          Container(
            height: ScreenAdapter.height(96),
            // width: ScreenAdapter.width(180),
            margin: EdgeInsets.only(
              left: ScreenAdapter.width(40),
              right: ScreenAdapter.width(40),
              top: ScreenAdapter.width(80),
              bottom: ScreenAdapter.width(80),
            ),
            child: RaisedButton(
              color: Color.fromRGBO(255, 66, 65, 1.0),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              elevation: 0,
              child: Text(
                '退出登录',
                style: TextStyle(
                  fontSize: ScreenAdapter.size(32),
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                ),
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(96),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
