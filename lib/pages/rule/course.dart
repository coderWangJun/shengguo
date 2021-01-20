import 'dart:io';

import 'package:flutter/material.dart';

import '../../services/screenAdapter.dart';
import 'dart:async';
import 'dart:convert';

// ignore: must_be_immutable
class CoursePage extends StatefulWidget {
  @override
  Map arguments;
  CoursePage({Key key, this.arguments}) : super(key: key);
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  // 商品平台类型选择1淘宝2拼多多3京东
  int _pf = 1;

  String _agreementData = '';

  @override
  //初始化
  void initState() {
    this._pf = widget.arguments["type"];
    super.initState();
    _courseBox();
    //监听滚动条滚动事件
  }

  // ignore: missing_return
  Widget _selectedPlatform(index) {
    // 商品平台类型选择1淘宝2拼多多3京东
    setState(() {
      this._pf = index;
      this._courseBox();
    });
  }

  // 二级导航(平台)
  Widget _subnavPlatformWidget() {
    return Positioned(
      top: 0,
      width: ScreenAdapter.width(750),
      height: ScreenAdapter.height(80),
      child: Container(
        width: ScreenAdapter.width(750),
        height: ScreenAdapter.height(80),
        // color: Colors.red,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Color.fromRGBO(233, 233, 233, 0.9),
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    ScreenAdapter.height(15),
                    0,
                    ScreenAdapter.height(15),
                  ),
                  child: Text(
                    "淘宝",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: (this._pf == 1)
                          ? Color.fromRGBO(255, 75, 65, 1.0)
                          : Color.fromRGBO(51, 51, 51, 1.0),
                    ),
                  ),
                ),
                onTap: () {
                  _selectedPlatform(1);
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    ScreenAdapter.height(15),
                    0,
                    ScreenAdapter.height(15),
                  ),
                  child: Text(
                    "拼多多",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: (this._pf == 2)
                          ? Color.fromRGBO(255, 75, 65, 1.0)
                          : Color.fromRGBO(51, 51, 51, 1.0),
                    ),
                  ),
                ),
                onTap: () {
                  _selectedPlatform(2);
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    ScreenAdapter.height(15),
                    0,
                    ScreenAdapter.height(15),
                  ),
                  child: Text(
                    "京东",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: (this._pf == 3)
                          ? Color.fromRGBO(255, 75, 65, 1.0)
                          : Color.fromRGBO(51, 51, 51, 1.0),
                    ),
                  ),
                ),
                onTap: () {
                  _selectedPlatform(3);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _courseBox() {
    // ignore: unused_local_variable
    String imgUrl = 'images/coursetbandroid.png';
    print(this._pf);
    if (this._pf == 1 && Platform.isIOS) {
      imgUrl = 'images/coursetbios.png';
      // ignore: unnecessary_statements
    } else if (this._pf == 2) {
      imgUrl = 'images/coursepdd.png';
    } else if (this._pf == 3) {
      imgUrl = 'images/coursejd.png';
    } else {
      imgUrl = 'images/coursetbandroid.png';
    }
    return Container(
      margin: EdgeInsets.only(top: ScreenAdapter.height(80)),
      child: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        // reverse: true,
        // padding: EdgeInsets.only(top: ScreenAdapter.height(80)),
        child: Column(
          children: <Widget>[
            Image.asset(
              imgUrl,
              fit: BoxFit.cover,
              width: ScreenAdapter.width(750),
              // height: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "省钱教程",
          style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1.0),
            fontSize: ScreenAdapter.width(36),
          ),
        ),
        leading: BackButton(
          color: Color.fromRGBO(51, 51, 51, 1.0),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
        elevation: 1,
        centerTitle: true,
      ),
      // body: Text("${widget.arguments}"),
      body: Stack(
        children: <Widget>[
          _courseBox(),
          _subnavPlatformWidget(),
        ],
      ),
    );
  }
}
