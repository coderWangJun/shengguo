// import 'dart:ui';
// import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

// 微信登录分享插件
class WxInitFun {
  // 注册wxApi
  static initWx() async {
    try {
      await fluwx.registerWxApi(
        appId: "wxb2e8c0e3e7a99459",
        universalLink: "https://zf.xianlady.com/",
        doOnAndroid: true,
        doOnIOS: true,
      );
    } catch (e) {}
  }

  //微信登录授权
  static fluwxLogin() async {
    fluwx
        .sendWeChatAuth(
      scope: "snsapi_userinfo",
      state: 'wechat_sdk_demo_test',
    )
        .then((value) {
      // return InitFun.fluwxCode();
      print(value);
    }).catchError((e) {
      print('wxcodefalse $e');
    });
  }

  // // 获取code码
  // static fluwxCode() {
  //   fluwx.responseFromAuth.listen((res) async {
  //     if (res is fluwx.WeChatAuthResponse) {
  //       //返回的res.code就是授权code
  //       print('wx_code${res.code}');
  //       return res.code;
  //     }
  //   });
  // }

  // 判断用户手机是否安装微信
  static installFluwx() async {
    bool result = fluwx.isWeChatInstalled as bool;
    if (result) {
      print('该手机上安装了微信');
    } else {
      print('该手机上未安装微信');
    }
  }
}
