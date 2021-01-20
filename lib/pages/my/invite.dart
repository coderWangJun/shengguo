import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:shengguo/services/screenAdapter.dart';
import '../../widget/iconFontWidget.dart';

/// 自定义的设置选项组件。
class InvitePage extends StatefulWidget {
  @override
  _InvitePageState createState() => _InvitePageState();
}

/// 与自定义的设置选项组件关联的状态子类。
class _InvitePageState extends State<InvitePage> {
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "邀请赚钱",
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
            height: ScreenAdapter.height(470),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/icon/icon_jingdong.png',
                  fit: BoxFit.cover,
                  width: ScreenAdapter.width(188),
                  height: ScreenAdapter.width(188),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: ScreenAdapter.height(10),
                  ),
                  child: Text(
                    "省果",
                    style: TextStyle(
                      color: Color.fromRGBO(51, 51, 51, 1.0),
                      fontSize: ScreenAdapter.size(38),
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
                      "当前版本",
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
                      "v3.7.0",
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
                        "用户协议",
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
                Navigator.pushNamed(
                  context,
                  '/agreement',
                  arguments: {
                    "type": 1,
                  },
                );
              },
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
                        "隐私协议",
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
                Navigator.pushNamed(
                  context,
                  '/agreement',
                  arguments: {
                    "type": 2,
                  },
                );
              },
            ),
          ),
          Divider(
            height: 0,
          ),
        ],
      ),
    );
  }
}
