import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:shengguo/services/screenAdapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../config/http_config.dart';

/// 自定义的设置选项组件。
class AgreementOptions extends StatefulWidget {
  @override
  Map arguments;

  AgreementOptions({Key key, this.arguments}) : super(key: key);
  _AgreementOptionsState createState() => _AgreementOptionsState();
}

/// 与自定义的设置选项组件关联的状态子类。
class _AgreementOptionsState extends State<AgreementOptions> {
  int _type = 1;

  String _agreementData = '';

  @override
  //初始化
  void initState() {
    this._type = widget.arguments["type"];
    super.initState();
    this._getAgreementData();
  }

  _getAgreementData() async {
    Options options = Options(headers: {'version': 'v2'});
    var goodsListApi = '${config.base_url}api/config/single_page';
    Response response;
    Dio dio = Dio();
    response = await dio.get(goodsListApi, options: options);
    for (var country in response.data["data"]) {
      if (country["id"] == this._type) {
        setState(() {
          this._agreementData = country["content"];
        });
      }
    }
  }

  Widget _agreementFun() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(ScreenAdapter.width(20)),
      child: Html(
        data: this._agreementData,
      ),
    );
  }

  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _type == 1 ? '用户协议' : '隐私协议',
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
          _agreementFun(),
        ],
      ),
    );
  }
}
