// 提现列表页面
// 余额提现
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:shengguo/services/screenAdapter.dart';
import '../../widget/iconFontWidget.dart';

/// 自定义的设置选项组件。
class CashOutList extends StatefulWidget {
  @override
  _CashOutListState createState() => _CashOutListState();
}

/// 与自定义的设置选项组件关联的状态子类。
class _CashOutListState extends State<CashOutList> {
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "提现明细",
          style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1.0),
            fontSize: ScreenAdapter.width(36),
          ),
        ),
        leading: BackButton(
          color: Color.fromRGBO(51, 51, 51, 1.0),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(
          top: 0,
          bottom: 0,
          left: ScreenAdapter.width(24),
          right: ScreenAdapter.width(24),
        ),
        children: <Widget>[
          InkWell(
            child: ListTile(
              title: Text('asdadadasd'),
              subtitle: Text('asdadadasd'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text('qqqqqqqqqqqqq'),
                  Text('asdadadasd'),
                ],
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/cashOutDetails',
                arguments: {
                  "type": 2,
                },
              );
            },
          ),
          Divider(
            height: 0,
          ),
          InkWell(
            child: ListTile(
              title: Text('asdadadasd'),
              subtitle: Text('asdadadasd'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text('qqqqqqqqqqqqq'),
                  Text('asdadadasd'),
                ],
              ),
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
