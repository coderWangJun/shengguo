import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:shengguo/services/screenAdapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../config/http_config.dart';

/// 自定义的设置选项组件。
class CashOutDetails extends StatefulWidget {
  @override
  Map arguments;

  CashOutDetails({Key key, this.arguments}) : super(key: key);
  _CashOutDetailsState createState() => _CashOutDetailsState();
}

/// 与自定义的设置选项组件关联的状态子类。
class _CashOutDetailsState extends State<CashOutDetails> {
  int _type = 1;

  @override
  //初始化
  void initState() {
    this._type = widget.arguments["type"];
    super.initState();
  }

  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '提现详情',
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
      body: Container(
        child: Column(
          children: [
            Stepper(
              currentStep: this._type,
              controlsBuilder: (BuildContext context,
                  {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                return Container();
              },
              // onStepTapped: (index) {
              //   setState(() {
              //     // ignore: unnecessary_statements
              //     StepState.editing;
              //   });
              // },
              steps: <Step>[
                Step(
                  title: Text('0.33元提现申请已提交'),
                  subtitle: Text('今天是2020-4-23'),
                  content: Container(
                    height: ScreenAdapter.height(40),
                    width: double.infinity,
                    child: Text(' '),
                  ),
                  isActive: true,
                ),
                Step(
                  title: Text('处理中，预计48小时内到账'),
                  subtitle: Text('今天是2020-4-24'),
                  content: Container(
                    height: ScreenAdapter.height(40),
                    width: double.infinity,
                    child: Text(' '),
                  ),
                  isActive: true,
                ),
                Step(
                  title: Text('微信到账成功'),
                  subtitle: Text('今天是2020-4-25'),
                  content: Container(
                    height: ScreenAdapter.height(40),
                    width: double.infinity,
                    child: Text(' '),
                  ),
                ),
              ],
            ),
            Container(
              height: ScreenAdapter.height(96),
              width: ScreenAdapter.height(670),
              margin: EdgeInsets.only(
                left: ScreenAdapter.width(40),
                top: ScreenAdapter.width(40),
                right: ScreenAdapter.width(40),
              ),
              child: RaisedButton(
                color: Color.fromRGBO(239, 239, 239, 1.0),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                elevation: 0,
                child: Text(
                  '邀请好友下单',
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
          ],
        ),
      ),
    );
  }
}
