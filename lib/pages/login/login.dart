import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:shengguo/services/http_service.dart';
import 'package:shengguo/services/screenAdapter.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:dio/dio.dart';
import '../../config/http_config.dart';
import '../../services/memberStorage.dart';
import '../../routers/router.dart';

import '../../config/wxinit.dart';

/// 自定义的设置选项组件。
class LoginOptions extends StatefulWidget {
  @override
  _LoginOptionsState createState() => _LoginOptionsState();
}

/// 与自定义的设置选项组件关联的状态子类。
class _LoginOptionsState extends State<LoginOptions> {
  @override
  void initState() {
    super.initState();

    //监听微信授权返回结果
    fluwx.responseFromAuth.distinct((a, b) => a == b).listen((res) {
      if (res is fluwx.WeChatAuthResponse) {
        //返回的res.code就是授权code
        print('code 码是 —————————————${res.code}');
        HttpRequest.request("api/account/oauth2", method: "post", params: {
          "device_id": " ",
          'wx_code': res.code,
        }).then((res) {
          print(res);
          ManberServices.setTokenData(res['data']['token']);
          _memberInfoData();
        });
      }
    });
  }

  // 微信登录方法
  // ignore: missing_return
  _wxLogin() {
    WxInitFun.fluwxLogin();
  }

  // 获取member 数据
  _memberInfoData() {
    HttpRequest.request("api/member/info", method: "get", params: {}).then(
      (res) async {
        await ManberServices.setMemberData(res['data']['info']);
        // 返回首页
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/',
          (route) => route == null,
        );
      },
    );
  }

  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Color.fromRGBO(51, 51, 51, 1.0),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: ScreenAdapter.height(40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'images/loginbg.png',
              fit: BoxFit.cover,
              height: ScreenAdapter.height(398),
              width: ScreenAdapter.width(750),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenAdapter.height(50),
              ),
              child: Text(
                "省钱高达90%的",
                style: TextStyle(
                  color: Color.fromRGBO(255, 66, 65, 1.0),
                  fontSize: ScreenAdapter.size(30),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenAdapter.height(5),
              ),
              child: Text(
                "购物优惠券搜索平台",
                style: TextStyle(
                  color: Color.fromRGBO(255, 66, 65, 1.0),
                  fontSize: ScreenAdapter.size(30),
                ),
              ),
            ),
            Container(
              height: ScreenAdapter.height(74),
              width: ScreenAdapter.width(500),
              margin: EdgeInsets.only(
                left: ScreenAdapter.width(125),
                right: ScreenAdapter.width(125),
                top: ScreenAdapter.width(138),
                bottom: ScreenAdapter.width(80),
              ),
              child: RaisedButton(
                color: Color.fromRGBO(0, 200, 0, 1.0),
                onPressed: () {
                  _wxLogin();
                },
                elevation: 0,
                child: Text(
                  '微信登录',
                  style: TextStyle(
                    fontSize: ScreenAdapter.size(32),
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(74),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              // heightFactor: 2,
              // widthFactor: 2,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  "登录即代表您同意《用户协议》和《隐私政策》",
                  style: TextStyle(
                    color: Color.fromRGBO(255, 66, 65, 1.0),
                    fontSize: ScreenAdapter.size(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
