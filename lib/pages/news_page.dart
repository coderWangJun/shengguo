import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:shengguo/services/screenAdapter.dart';
import '../widget/iconFontWidget.dart';

/// 自定义的设置选项组件。
class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

/// 与自定义的设置选项组件关联的状态子类。
class _NewsPageState extends State<NewsPage> {
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "消息",
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1.0),
            fontSize: ScreenAdapter.width(36),
          ),
        ),
        actions: <Widget>[
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
          Padding(
            padding: EdgeInsets.only(
              right: ScreenAdapter.width(5),
            ),
            child: Center(
              child: Text(
                "全部已读",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  fontSize: ScreenAdapter.width(36),
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Color.fromRGBO(255, 66, 65, 1.0),
        elevation: 1,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Image.asset("assets/icon/mymenu8.png"),
            title: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "温馨提示",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "0.785546",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            subtitle: Text("快点跑路快点跑路快点跑路快点跑路快点跑路快点跑路快点跑路快点跑路快点跑路快点跑路快点跑路"),
          ),
          Divider(
            height: 0,
          ),
        ],
      ),
    );
  }
}
