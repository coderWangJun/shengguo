//网易七鱼客服插件
import 'package:flutter/material.dart';
import 'package:flutter_qiyu/flutter_qiyu.dart';

class QiYuInitFun {
  static initQiYu() {
    // 网易七鱼注册
    QiYu.registerApp(
      appKey: 'd92eedde7d6c98a24cf8880732a18aea',
      appName: '省果',
    );
  }
}
