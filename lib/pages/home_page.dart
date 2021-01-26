import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../config/http_config.dart';
import 'package:dio/dio.dart';
import '../widget/loadingWidget.dart';

import '../services/screenAdapter.dart';
import '../widget/loadingWidget.dart';
import '../config/wxinit.dart';
import '../config/qiyukefuinit.dart';
import '../config/albcinit.dart';
import 'dart:async';
import 'dart:convert';
// 轮播图类模型

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List _hotProductList = []; //热门专题活动数据
  List _focusData = []; //轮播图数据
  List _categoryDataList = []; //商品分类数据
  List _goodsListDataList = []; //首页推荐商品数据

  int _page = 1;

  @override
  bool get wantKeepAlive => true;

  // 上拉分页
  ScrollController _scrollController = ScrollController(); //listview控制器
  @override
  void initState() {
    super.initState();
    // 微信初始化等
    WxInitFun.initWx();
    // AlbcInitFun.initAlbc();
    QiYuInitFun.initQiYu();
    _gethotProductData();

    _getFocusData();
    _getCategoryData();
    _getGoodsListData();
    //监听滚动条滚动事件
    _scrollController.addListener(() {
      _scrollController.position.pixels; //获取滚动条滚动的高度
      _scrollController.position.maxScrollExtent; //获取整个页面高度
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 20) {
        // if (this._flag && this._hasMore) {
        _getGoodsListData();
        // }
      }
    });
  }

  // 获取热门专题活动数据
  _gethotProductData() async {
    var api = "${config.base_url}api/article/list?type=2";
    Response response;
    Dio dio = Dio();
    response = await dio.get(api);
    // print(response.data.toString());
    // var data = response.data.toString();
    // print(response.data['data']["list"]);
    setState(() {
      this._hotProductList = response.data['data']["list"];
    });
  }

  // 获取轮播图数据
  _getFocusData() async {
    var api = "${config.base_url}api/article/list?type=1";
    Response response;
    Dio dio = Dio();
    response = await dio.get(api);
    // print(response.data.toString());
    var data = response.data.toString();
    // print(response.data['data']["list"]);
    setState(() {
      this._focusData = response.data['data']['list'];
    });
  }

  // 获取首页商品分类数据
  _getCategoryData() async {
    var api = "${config.base_url}api/goods/cids";
    Response response;
    Dio dio = Dio();
    response = await dio.get(api);
    // print(response.data.toString());
    var data = response.data.toString();
    // print(response.data['data']["cids"]);
    setState(() {
      this._categoryDataList = response.data['data']["cids"];
    });
  }

  _getGoodsListData() async {
    Options options = Options(headers: {'version': 'v2'});
    var apilist = "${config.base_url}api/goods_list/list?next_p=${this._page}";
    Response response;
    Dio dio = Dio();
    response = await dio.get(apilist, options: options);
    // print(response.data);
    // var data = response.data.toString();
    // print(json.decode(response.data.toString()));
    setState(() {
      this._goodsListDataList.addAll(response.data['data']["list"]);
      this._page++;
    });
  }

  //   // 判断是否显示加载中的提示
  // Widget _showMore(index) {
  //   if (this._hasMore) {
  //     return (index == this._goodsList.length - 1) ? LoadingWidget() : Text("");
  //   } else {
  //     return (index == this._goodsList.length - 1)
  //         ? Text("---我是有底线的---")
  //         : Text("");
  //   }
  // }

  // 首页轮播图
  Widget _swiperWidget() {
    if (this._focusData.length > 0) {
      return Container(
        // AspectRatio 配置轮播图宽高比
        margin: EdgeInsets.all(ScreenAdapter.width(10)),
        child: AspectRatio(
          aspectRatio: 7 / 2,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                "${config.base_url}" "${this._focusData[index]['pic_url']}",
                fit: BoxFit.fill,
              );
            },
            itemCount: this._focusData.length, //轮播图个数
            pagination: new SwiperPagination(), //分页器
            autoplay: true, //是否自动轮播
          ),
        ),
      );
    } else {
      return Text('');
    }
  }

  Widget _titleWidget(value) {
    return Container(
      height: ScreenAdapter.height(50),
      margin: EdgeInsets.only(left: ScreenAdapter.width(20)),
      padding: EdgeInsets.only(left: ScreenAdapter.width(20)),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.red, width: 2),
        ),
      ),
      child: Text(
        value,
        style: TextStyle(color: Colors.black54),
      ),
    );
  }

  //热门专题活动
  Widget _hotProductListWidget() {
    if (this._hotProductList.length > 0) {
      return Container(
        height: ScreenAdapter.height(210),
        width: ScreenAdapter.height(750),
        padding: EdgeInsets.all(ScreenAdapter.width(10)),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              child: Column(
                children: <Widget>[
                  Container(
                    height: ScreenAdapter.height(126),
                    width: ScreenAdapter.width(126),
                    margin: EdgeInsets.all(
                      ScreenAdapter.width(10),
                    ),
                    child: Image.network(
                      "${config.base_url}${this._hotProductList[index]['pic_url']}",
                      width: ScreenAdapter.width(126),
                      height: ScreenAdapter.height(126),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Container(
                    height: ScreenAdapter.height(40),
                    child: Text(
                      "${this._hotProductList[index]['title']}",
                      style: TextStyle(
                        color: Color.fromRGBO(51, 51, 51, 1.0),
                        fontSize: ScreenAdapter.width(26),
                      ),
                    ),
                  )
                ],
              ),
              onTap: () {
                // Navigator.pushNamed(context, '/freePurchase');
                Navigator.pushNamed(
                  context,
                  "/course",
                  arguments: {
                    "type": 2,
                  },
                );
              },
            );
          },
          itemCount: 5,
        ),
      );
    } else {
      return Text(" ");
    }
  }

  // 商品分类导航
  Widget _goodsCategoryWidget() {
    if (this._categoryDataList.length > 0) {
      return Container(
        padding: EdgeInsets.all(ScreenAdapter.width(10)),
        height: ScreenAdapter.height(60),
        // width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              height: ScreenAdapter.height(40),
              width: ScreenAdapter.height(120),
              child: Text("${this._categoryDataList[index]['name']}"),
            );
          },
          itemCount: this._categoryDataList.length,
        ),
      );
    } else {
      return Text("男装");
    }
  }

  // 首页商品列表
  Widget _goodsListWidget() {
    print(this._goodsListDataList.length);
    if (this._goodsListDataList.length > 0) {
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
                        "${this._goodsListDataList[index]['pict_url']}",
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
                              "${this._goodsListDataList[index]['short_title']}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "${this._goodsListDataList[index]['shop_title']}",
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
                                    "券${this._goodsListDataList[index]['coupon_amount']}元",
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
                                    "返${this._goodsListDataList[index]['per_price']}元",
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "到手价￥${this._goodsListDataList[index]['end_price']}",
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
          itemCount: this._goodsListDataList.length,
        ),
      );
    } else {
      return LoadingWidget();
      // return Text("暂无数据");
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 66, 65, 1.0),
        // backgroundColor: Colors.transparent,
        elevation: 0,
        title: InkWell(
          child: Container(
            height: ScreenAdapter.height(80),
            decoration: BoxDecoration(
              color: Color.fromRGBO(233, 233, 233, 1.0),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.only(
              left: ScreenAdapter.height(10),
              right: ScreenAdapter.height(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.search),
                Text(
                  "data",
                  style: TextStyle(
                    fontSize: ScreenAdapter.size(28),
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/search');
          },
        ),
      ),
      body: ListView(
        controller: _scrollController,
        children: <Widget>[
          _hotProductListWidget(),
          SizedBox(height: ScreenAdapter.width(15)),
          _titleWidget("猜你喜欢"),
          SizedBox(height: ScreenAdapter.width(15)),
          _swiperWidget(),
          SizedBox(height: ScreenAdapter.width(15)),
          _goodsCategoryWidget(),
          SizedBox(height: ScreenAdapter.width(15)),
          _goodsListWidget()
        ],
      ),
    );
  }
}
