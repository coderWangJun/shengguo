// 余额提现
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:shengguo/services/screenAdapter.dart';
import '../../widget/iconFontWidget.dart';

/// 自定义的设置选项组件。
class CashOut extends StatefulWidget {
  @override
  _CashOutState createState() => _CashOutState();
}

/// 与自定义的设置选项组件关联的状态子类。
class _CashOutState extends State<CashOut> {
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "余额提现",
          style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1.0),
            fontSize: ScreenAdapter.width(36),
          ),
        ),
        leading: BackButton(
          color: Color.fromRGBO(51, 51, 51, 1.0),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: ScreenAdapter.width(20),
            ),
            child: Center(
              child: InkWell(
                child: Text(
                  "明细",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1.0),
                    fontSize: ScreenAdapter.width(36),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/cashOutList');
                },
              ),
            ),
          ),
        ],
        backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: ScreenAdapter.height(20),
            width: double.infinity,
            color: Color.fromRGBO(249, 249, 249, 1.0),
          ),
          Container(
            height: ScreenAdapter.height(138),
            color: Color.fromRGBO(255, 255, 255, 1.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: ScreenAdapter.width(40),
                    right: ScreenAdapter.width(35),
                  ),
                  child: Icon(
                    IconfontsWidget.weixin,
                    color: Color.fromRGBO(80, 182, 116, 1.0),
                    size: ScreenAdapter.size(108),
                  ),
                ),
                Expanded(
                  child: Text(
                    '已绑定',
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
                        right: ScreenAdapter.width(43),
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
          Container(
            height: ScreenAdapter.height(20),
            width: double.infinity,
            color: Color.fromRGBO(249, 249, 249, 1.0),
          ),
          Container(
            padding: EdgeInsets.only(
              right: ScreenAdapter.width(40),
              left: ScreenAdapter.width(40),
              top: ScreenAdapter.width(25),
              bottom: ScreenAdapter.width(25),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.ltr,
              children: [
                Text(
                  "提现金额",
                  style: TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1.0),
                    fontSize: ScreenAdapter.size(32),
                  ),
                ),
                Container(
                  // height: ScreenAdapter.height(45),
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    top: ScreenAdapter.width(20),
                    bottom: ScreenAdapter.width(20),
                  ),
                  child: TextField(
                    style: TextStyle(
                      color: Color.fromRGBO(51, 51, 51, 1.0),
                    ),
                    minLines: 1,
                    maxLines: 1,
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(
                        top: ScreenAdapter.height(30),
                        bottom: ScreenAdapter.height(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      icon: Icon(
                        Icons.person,
                        color: Color.fromRGBO(51, 51, 51, 1.0),
                      ),
                      hintText: '最低不少于1元',
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(51, 51, 51, 1.0),
                      ),
                      prefixStyle: TextStyle(
                        color: Color.fromRGBO(51, 51, 51, 1.0),
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                Divider(
                  height: 0,
                  // color: Color.fromRGBO(r, g, b, opacity),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: ScreenAdapter.height(20),
                    bottom: ScreenAdapter.height(20),
                    left: ScreenAdapter.height(4),
                    right: ScreenAdapter.height(4),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "可提现金额",
                          style: TextStyle(
                            color: Color.fromRGBO(51, 51, 51, 1.0),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "每日最大提现金额为200元",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 79, 81, 1.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: ScreenAdapter.height(96),
                  width: ScreenAdapter.height(670),
                  margin: EdgeInsets.only(
                    top: ScreenAdapter.width(60),
                    bottom: ScreenAdapter.width(40),
                  ),
                  child: RaisedButton(
                    color: Color.fromRGBO(255, 66, 65, 1.0),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    elevation: 0,
                    child: Text(
                      '确认提现',
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
                Container(
                  height: ScreenAdapter.height(96),
                  width: ScreenAdapter.height(670),
                  child: RaisedButton(
                    color: Color.fromRGBO(239, 239, 239, 1.0),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    elevation: 0,
                    child: Text(
                      '联系客服',
                      style: TextStyle(
                        fontSize: ScreenAdapter.size(32),
                        color: Color.fromRGBO(51, 51, 51, 1.0),
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
                Padding(
                  padding: EdgeInsets.all(
                    ScreenAdapter.height(40),
                  ),
                  child: RichText(
                    text: TextSpan(
                        text: 'hello',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        children: <InlineSpan>[
                          WidgetSpan(
                            child: FlutterLogo(),
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.ideographic,
                          ),
                          TextSpan(
                            text: '123123',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          TextSpan(
                            text: '5555',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          )
                        ]),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
