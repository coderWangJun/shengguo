// 零元购页面
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:shengguo/services/screenAdapter.dart';
import 'package:dio/dio.dart';
import '../../config/http_config.dart';

/// 自定义的设置选项组件。
class FreePurchasePage extends StatefulWidget {
  @override
  _FreePurchasePageState createState() => _FreePurchasePageState();
}

/// 与自定义的设置选项组件关联的状态子类。
class _FreePurchasePageState extends State<FreePurchasePage> {
  // ignore: unused_field
  List _goodsListData = []; //零元购商品列表
  void initState() {
    super.initState();
    // 获取零元购商品列表
    _getGoodsListData();
  }

  // 获取热门专题活动数据
  _getGoodsListData() async {
    var apiUrl = "${config.base_url}api/goods_list/list?type=2";
    Options options = Options(headers: {
      'version': 'v2',
    });
    Response response;
    Dio dio = Dio();
    response = await dio.get(apiUrl, options: options);
    setState(() {
      this._goodsListData = response.data['data']["list"];
    });
  }

  Widget _goodsListWidget() {
    if (this._goodsListData.length > 0) {
      return Container(
        padding: EdgeInsets.all(ScreenAdapter.height(10)),
        margin: EdgeInsets.only(top: ScreenAdapter.height(10)),
        child: ListView.builder(
          shrinkWrap: true,
          physics: new NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: ScreenAdapter.width(180),
                      height: ScreenAdapter.height(180),
                      child: Image.network(
                        "${this._goodsListData[index]['pict_url']}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: ScreenAdapter.height(210),
                        margin: EdgeInsets.only(left: ScreenAdapter.width(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${this._goodsListData[index]['short_title']}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "${this._goodsListData[index]['shop_title']}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  height: ScreenAdapter.height(36),
                                  margin: EdgeInsets.only(
                                    right: ScreenAdapter.width(36),
                                  ),
                                  padding: EdgeInsets.fromLTRB(
                                    ScreenAdapter.width(5),
                                    ScreenAdapter.width(0),
                                    ScreenAdapter.width(5),
                                    ScreenAdapter.width(0),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      ScreenAdapter.width(15),
                                    ),
                                    color: Color.fromRGBO(230, 230, 230, 0.8),
                                  ),
                                  child: Text(
                                    "券${this._goodsListData[index]['coupon_amount']}元",
                                  ),
                                ),
                                Container(
                                  height: ScreenAdapter.height(36),
                                  margin: EdgeInsets.only(
                                    right: ScreenAdapter.width(36),
                                  ),
                                  padding: EdgeInsets.fromLTRB(
                                    ScreenAdapter.width(5),
                                    ScreenAdapter.width(0),
                                    ScreenAdapter.width(5),
                                    ScreenAdapter.width(0),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      ScreenAdapter.width(15),
                                    ),
                                    color: Color.fromRGBO(230, 230, 230, 0.8),
                                  ),
                                  child: Text(
                                    "返${this._goodsListData[index]['per_price']}元",
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "到手价￥${this._goodsListData[index]['end_price']}",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: ScreenAdapter.height(20),
                ),
                // 在页面数据最尾部加一个加载中的状态
                // _showMore(index),
              ],
            );
          },
          itemCount: this._goodsListData.length,
        ),
      );
    } else {
      return Text("data");
    }
  }

  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "新人免单",
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
      backgroundColor: Color.fromRGBO(255, 66, 65, 1.0),
      body: ListView(
        children: <Widget>[
          Container(
            height: ScreenAdapter.height(360),
            width: ScreenAdapter.width(750),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/freepurchasebg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: ScreenAdapter.height(160),
            width: ScreenAdapter.width(750),
            padding: EdgeInsets.only(
              right: ScreenAdapter.width(80),
              left: ScreenAdapter.width(80),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                          bottom: ScreenAdapter.width(20),
                        ),
                        child: Image.asset(
                          'assets/icon/gouwuche.png',
                          fit: BoxFit.cover,
                          width: ScreenAdapter.width(68),
                          height: ScreenAdapter.width(68),
                        ),
                      ),
                      Container(
                        child: Text(
                          '选择心仪好物',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                            fontSize: ScreenAdapter.width(26),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                          bottom: ScreenAdapter.width(20),
                        ),
                        child: Image.asset(
                          'assets/icon/dian.png',
                          fit: BoxFit.cover,
                          width: ScreenAdapter.width(68),
                          height: ScreenAdapter.width(68),
                        ),
                      ),
                      Container(
                        child: Text(''),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                          bottom: ScreenAdapter.width(20),
                        ),
                        child: Image.asset(
                          'assets/icon/haowu.png',
                          fit: BoxFit.cover,
                          width: ScreenAdapter.width(68),
                          height: ScreenAdapter.width(68),
                        ),
                      ),
                      Container(
                        child: Text(
                          '0元购物',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                            fontSize: ScreenAdapter.width(26),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                          bottom: ScreenAdapter.width(20),
                        ),
                        child: Image.asset(
                          'assets/icon/dian.png',
                          fit: BoxFit.cover,
                          width: ScreenAdapter.width(68),
                          height: ScreenAdapter.width(68),
                        ),
                      ),
                      Container(
                        child: Text(''),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                          bottom: ScreenAdapter.width(20),
                        ),
                        child: Image.asset(
                          'assets/icon/yaoqing.png',
                          fit: BoxFit.cover,
                          width: ScreenAdapter.width(68),
                          height: ScreenAdapter.width(68),
                        ),
                      ),
                      Container(
                        child: Text(
                          '邀请好友得5元',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                            fontSize: ScreenAdapter.width(26),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // 零元购商品列表
          _goodsListWidget()
        ],
      ),
    );
  }
}
