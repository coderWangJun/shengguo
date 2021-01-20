import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_qiyu/flutter_qiyu.dart';
import 'package:shengguo/services/screenAdapter.dart';

/// 自定义的设置选项组件。
class KefuPage extends StatefulWidget {
  @override
  _KefuPageState createState() => _KefuPageState();
}

/// 与自定义的设置选项组件关联的状态子类。
class _KefuPageState extends State<KefuPage> {
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "省果在线客服",
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
          FlatButton(
            child: Text('联系客服'),
            onPressed: () {
              // 用户信息上传
              QYUserInfoParams userInfoParams = QYUserInfoParams.fromJson({
                'userId': '111',
                'data':
                    '[{\"key\":\"real_name\", \"value\":\"土豪\"},{\"key\":\"mobile_phone\", \"hidden\":true},{\"key\":\"email\", \"value\":\"13800000000@163.com\"},{\"index\":0, \"key\":\"account\", \"label\":\"账号\", \"value\":\"zhangsan\", \"href\":\"http://example.domain/user/zhangsan\"},{\"index\":1, \"key\":\"sex\", \"label\":\"性别\", \"value\":\"先生\"},{\"index\":5, \"key\":\"reg_date\", \"label\":\"注册日期\", \"value\":\"2015-11-16\"},{\"index\":6, \"key\":\"last_login\", \"label\":\"上次登录时间\", \"value\":\"2015-12-22 15:38:54\"}]'
              });
              QiYu.setUserInfo(userInfoParams);

              QYServiceWindowParams serviceWindowParams =
                  QYServiceWindowParams.fromJson({
                'source': {
                  'sourceTitle': '省果客服',
                  'sourceUrl': 'http://www.qiyukf.com',
                  'sourceCustomInfo': '我是来自自定义的信息'
                },
                'commodityInfo': {
                  'commodityInfoTitle': 'ReactNative商品',
                  'commodityInfoDesc': '这是来自网易七鱼ReactNative的商品描述',
                  'pictureUrl':
                      'http://qiyukf.com/res/img/companyLogo/blmn.png',
                  'commodityInfoUrl': 'http://www.qiyukf.com',
                  'note': '￥1000',
                  'show': true
                },
                'sessionTitle': '省果客服',
                'groupId': 398824171,
                'staffId': 4090768,
                'robotId': 0,
                'robotFirst': false,
                'faqTemplateId': 0,
                'vipLevel': 0,
                'showQuitQueue': true,
                'showCloseSessionEntry': true
              });
              QiYu.openServiceWindow(serviceWindowParams);
            },
          )
        ],
      ),
    );
  }
}
