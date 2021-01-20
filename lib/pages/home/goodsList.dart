import 'package:flutter/material.dart';

import '../../services/screenAdapter.dart';
import '../../config/http_config.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';
import '../../widget/loadingWidget.dart';
import '../../widget/iconFontWidget.dart';

// ignore: must_be_immutable
class GoodsListPage extends StatefulWidget {
  @override
  Map arguments;

  GoodsListPage({Key key, this.arguments}) : super(key: key);

  _GoodsListPageState createState() => _GoodsListPageState();
}

class _GoodsListPageState extends State<GoodsListPage> {
  //搜索关键字
  String _keyWord;
  //分页
  int _page = 1;
  //排序0不排序1销量升序-1销量降序2价格升序-2价格降序
  int _sort = 0;
  // 是否有券1只看有券0不作限制
  int _coupon = 0;
  // 商品平台类型选择1淘宝2拼多多3京东
  int _pf = 1;
  List _goodsList = [];
  // 加载中的状态 是否可以加载  true为可以加载 避免重复请求
  bool _flag = true;
  // 是否还有数据
  bool _hasMore = true;

  int selected1 = 1;

  int selected2 = 0;

  int selected3 = 0;

  int selected4 = 0;

  // 搜索框内容
  var _initKeyWordsController = new TextEditingController();

  // 上拉分页
  ScrollController _scrollController = ScrollController(); //listview控制器

  @override
  //初始化
  void initState() {
    this._keyWord = widget.arguments["keyWords"];
    this._initKeyWordsController.text = this._keyWord;
    // this._initKeyWordsController.text = this._keyWord;
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
    print(this._keyWord);

    Options options = Options(headers: {'version': 'v2'});
    var goodsListApi =
        '${config.base_url}api/goods_list/search?q=${this._keyWord}&next_p=${this._page}&sort=${this._sort}&has_coupon=${this._coupon}&pf=${this._pf}';
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
  Widget _searchWidget() {
    // 商品平台类型选择1淘宝2拼多多3京东
    setState(() {
      this._page = 1;
      this._flag = true;
      this._hasMore = true;
      this._goodsList = [];
      _scrollController.jumpTo(0);
      this._goodsListData();
    });
  }

  // ignore: missing_return
  Widget _selectedPlatform(index) {
    // 商品平台类型选择1淘宝2拼多多3京东
    setState(() {
      this._pf = index;
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
  Widget _sortComprehensive() {
    setState(() {
      this._sort = 0;
      this._coupon = 0;
      this._page = 1;
      this._flag = true;
      this._hasMore = true;
      this._goodsList = [];
      // 回到顶部
      this.selected1 = 1;
      this.selected2 = 0;
      this.selected3 = 0;
      this.selected4 = 0;
      _scrollController.jumpTo(0);
      this._goodsListData();
    });
  }

  //价格销量筛选排序 index 为1 是价格筛选 index为2是销量筛选
  // ignore: missing_return
  Widget _sortPriceNum(index) {
    setState(() {
      if (index == 1) {
        //价格筛选2价格升序-2价格降序
        this.selected3 = 0;
        if (this._sort == 2) {
          this._sort = -2;
          this.selected2 = -1;
        } else {
          this._sort = 2;
          this.selected2 = 1;
        }
      } else {
        //销量筛选1销量升序-1销量降序
        this.selected2 = 0;
        if (this._sort == 1) {
          this._sort = -1;
          this.selected3 = -1;
        } else {
          this._sort = 1;
          this.selected3 = 1;
        }
      }
      this._page = 1;
      this._flag = true;
      this._hasMore = true;
      this._goodsList = [];
      // 回到顶部
      this.selected1 = 0;

      _scrollController.jumpTo(0);
      this._goodsListData();
    });
  }

  // 优惠券筛选排序
  // ignore: missing_return
  Widget _sortCoupon() {
    setState(() {
      this._page = 1;
      this._flag = true;
      this._hasMore = true;
      this._goodsList = [];
      this.selected1 = 0;
      if (this._coupon == 1) {
        this._coupon = 0;
        this.selected4 = 0;
      } else {
        this._coupon = 1;
        this.selected4 = 1;
      }
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

  // 二级导航(筛选)
  Widget _subnavWidget() {
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
                  child: Text("综合",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: (this.selected1 == 1)
                            ? Color.fromRGBO(255, 75, 65, 1.0)
                            : Color.fromRGBO(51, 51, 51, 1.0),
                      )),
                ),
                onTap: () {
                  _sortComprehensive();
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "价格 ",
                        style: TextStyle(
                          color: (this.selected2 != 0)
                              ? Color.fromRGBO(255, 75, 65, 1.0)
                              : Color.fromRGBO(51, 51, 51, 1.0),
                        ),
                      ),
                      Icon(
                        (this.selected2 == 1)
                            ? IconfontsWidget.jiangxu
                            : ((this.selected2 == 0)
                                ? IconfontsWidget.jiangxu
                                : IconfontsWidget.shengxu),
                        color: (this.selected2 != 0)
                            ? Color.fromRGBO(255, 75, 65, 1.0)
                            : Color.fromRGBO(51, 51, 51, 1.0),
                        size: 16.0,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  _sortPriceNum(1);
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "销量 ",
                        style: TextStyle(
                          color: (this.selected3 != 0)
                              ? Color.fromRGBO(255, 75, 65, 1.0)
                              : Color.fromRGBO(51, 51, 51, 1.0),
                        ),
                      ),
                      Icon(
                        (this.selected3 == 1)
                            ? IconfontsWidget.jiangxu
                            : ((this.selected3 == 0)
                                ? IconfontsWidget.jiangxu
                                : IconfontsWidget.shengxu),
                        color: (this.selected3 != 0)
                            ? Color.fromRGBO(255, 75, 65, 1.0)
                            : Color.fromRGBO(51, 51, 51, 1.0),
                        size: 16.0,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  _sortPriceNum(2);
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        (this.selected4 == 1)
                            ? IconfontsWidget.xuanzhong
                            : IconfontsWidget.weixuanzhong,
                        // IconfontsWidget.weixuanzhong,
                        color: (this.selected4 == 1)
                            ? Color.fromRGBO(255, 75, 65, 1.0)
                            : Color.fromRGBO(51, 51, 51, 1.0),
                        size: 16.0,
                      ),
                      Text(
                        " 只看券",
                        style: TextStyle(
                          // color: Color.fromRGBO(51, 51, 51, 1.0),
                          color: (this.selected4 == 1)
                              ? Color.fromRGBO(255, 75, 65, 1.0)
                              : Color.fromRGBO(51, 51, 51, 1.0),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  _sortCoupon();
                },
              ),
            )
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
        title: Container(
          child: TextField(
            controller: this._initKeyWordsController,
            autofocus: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              setState(() {
                this._keyWord = value;
              });
            },
          ),
          height: ScreenAdapter.height(70),
          decoration: BoxDecoration(
            color: Color.fromRGBO(233, 233, 233, 0.8),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        actions: <Widget>[
          InkWell(
            child: Container(
              height: ScreenAdapter.height(60),
              width: ScreenAdapter.width(80),
              child: Row(
                children: <Widget>[Text("搜索")],
              ),
            ),
            onTap: () {
              _searchWidget();
            },
          )
        ],
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
