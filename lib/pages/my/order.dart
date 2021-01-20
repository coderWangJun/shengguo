// 订单页面
import 'package:flutter/material.dart';
import 'package:shengguo/widget/iconFontWidget.dart';
import '../../services/screenAdapter.dart';
import '../../config/http_config.dart';
import 'package:dio/dio.dart';
import '../../widget/loadingWidget.dart';

// ignore: must_be_immutable
class OrderPage extends StatefulWidget {
  @override
  Map arguments;

  OrderPage({Key key, this.arguments}) : super(key: key);

  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // 商品平台类型选择1淘宝天猫2拼多多3京东4美团
  int _pf = 1;
  // 订单类型 1全部类型2即将到账3已到账4无效订单
  int _orderType = 1;
  //分页
  int _page = 1;
  //排序0不排序1销量升序-1销量降序2价格升序-2价格降序
  int _sort = 0;

  List _goodsList = [];
  // 加载中的状态 是否可以加载  true为可以加载 避免重复请求
  bool _flag = true;
  // 是否还有数据
  bool _hasMore = true;
  // 上拉分页
  ScrollController _scrollController = ScrollController(); //listview控制器

  @override
  //初始化
  void initState() {
    super.initState();
    _goodsListData();
    //监听滚动条滚动事件
    _scrollController.addListener(() {
      _scrollController.position.pixels; //获取滚动条滚动的高度
      _scrollController.position.maxScrollExtent; //获取整个页面高度

      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 20) {
        if (this._flag && this._hasMore) {
          _goodsListData();
        }
      }
    });
  }

  // 判断是否显示加载中的提示
  Widget _showMore(index) {
    if (this._hasMore) {
      return (index == this._goodsList.length - 1) ? LoadingWidget() : Text("");
    } else {
      return (index == this._goodsList.length - 1)
          ? Text("---我是有底线的---")
          : Text("");
    }
  }

  // 获取商品列表数据
  _goodsListData() async {
    setState(() {
      this._flag = false;
    });
    Options options = Options(headers: {
      'version': 'v2',
      'token':
          '8bc9c71c301a21e10023550e3bf5377f04e00c8b6fb276069f9ce16132c3c3a6',
    });

    var goodsListApi =
        '${config.base_url}api/order/list?status=0&next_p=${this._page}&pf=${this._pf}';
    print(goodsListApi);
    Response response;
    Dio dio = Dio();
    response = await dio.get(goodsListApi, options: options);
    print(goodsListApi);
    // print(response.data.toString());
    if (response.data['data']["list"].length > 0) {
      this._hasMore = true;
    } else {
      this._hasMore = false;
    }
    setState(() {
      this._goodsList.addAll(response.data['data']["list"]);
      this._page++;
      this._flag = true;
    });
  }

  // ignore: missing_return
  Widget _selectedPlatform(index) {
    // 商品平台类型选择1淘宝2拼多多3京东
    setState(() {
      this._pf = index;
      this._orderType = 1;
      this._page = 1;
      this._flag = true;
      this._hasMore = true;
      this._goodsList = [];
      _scrollController.jumpTo(0);
      this._goodsListData();
    });
  }

  // 综合排序
  // ignore: missing_return
  Widget _orderTypeSelect(index) {
    setState(() {
      this._orderType = index;
      this._page = 1;
      this._flag = true;
      this._hasMore = true;
      this._goodsList = [];
      // 回到顶部
      _scrollController.jumpTo(0);
      this._goodsListData();
    });
  }

  // 商品列表
  Widget _goodsListWidget() {
    // print(this._goodsList.length);
    if (this._goodsList.length > 0) {
      return Container(
        padding: EdgeInsets.all(ScreenAdapter.height(10)),
        margin: EdgeInsets.only(top: ScreenAdapter.height(160)),
        child: ListView.builder(
          controller: _scrollController,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: ScreenAdapter.width(180),
                      height: ScreenAdapter.height(180),
                      child: Image.network(
                        "${this._goodsList[index]['pict_url']}",
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
                              "${this._goodsList[index]['short_title']}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "${this._goodsList[index]['shop_title']}",
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
                                    "券${this._goodsList[index]['coupon_amount']}元",
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
                                    "返${this._goodsList[index]['per_price']}元",
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "到手价￥${this._goodsList[index]['end_price']}",
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
                _showMore(index),
              ],
            );
          },
          itemCount: this._goodsList.length,
        ),
      );
    } else {
      return LoadingWidget();
      // return Text("暂无数据");
    }
  }

  // 二级导航(平台 淘宝天猫/拼多多/京东)
  Widget _subnavPlatformWidget() {
    print('pf===============================${this._pf}');
    return Positioned(
      top: 0,
      child: Container(
        width: ScreenAdapter.width(750),
        height: ScreenAdapter.height(80),
        // color: Colors.red,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 76, 65, 1.0),
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Color.fromRGBO(233, 233, 233, 0.9),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    "淘宝天猫",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: (this._pf == 1)
                          ? Color.fromRGBO(255, 255, 255, 1.0)
                          : Color.fromRGBO(255, 255, 255, 0.6),
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
                          ? Color.fromRGBO(255, 255, 255, 1.0)
                          : Color.fromRGBO(255, 255, 255, 0.6),
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
                          ? Color.fromRGBO(255, 255, 255, 1.0)
                          : Color.fromRGBO(255, 255, 255, 0.6),
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

  Widget _subnavWidget() {
    // 二级导航(类型)
    return Positioned(
      top: ScreenAdapter.height(80),
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  child: Text("全部",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: (this._orderType == 1)
                            ? Color.fromRGBO(255, 75, 65, 1.0)
                            : Color.fromRGBO(51, 51, 51, 1.0),
                      )),
                ),
                onTap: () {
                  _orderTypeSelect(1);
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
                  child: Text("即将到账",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: (this._orderType == 2)
                            ? Color.fromRGBO(255, 75, 65, 1.0)
                            : Color.fromRGBO(51, 51, 51, 1.0),
                      )),
                ),
                onTap: () {
                  _orderTypeSelect(2);
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
                  child: Text("已到账",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: (this._orderType == 3)
                            ? Color.fromRGBO(255, 75, 65, 1.0)
                            : Color.fromRGBO(51, 51, 51, 1.0),
                      )),
                ),
                onTap: () {
                  _orderTypeSelect(3);
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
                  child: Text("无效订单",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: (this._orderType == 4)
                            ? Color.fromRGBO(255, 75, 65, 1.0)
                            : Color.fromRGBO(51, 51, 51, 1.0),
                      )),
                ),
                onTap: () {
                  _orderTypeSelect(4);
                },
              ),
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
          "我的订单",
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1.0),
            fontSize: ScreenAdapter.width(36),
          ),
        ),
        leading: InkWell(
          child: Icon(
            IconfontsWidget.jiantouleft,
            color: Color.fromRGBO(255, 255, 255, 1.0),
            size: ScreenAdapter.width(36.0),
          ),
          onTap: () {},
        ),
        backgroundColor: Color.fromRGBO(255, 76, 65, 1.0),
        elevation: 0,
        centerTitle: true,
      ),
      // body: Text("${widget.arguments}"),
      body: Stack(
        children: <Widget>[
          _goodsListWidget(),
          _subnavPlatformWidget(),
          _subnavWidget(),
        ],
      ),
    );
  }
}
