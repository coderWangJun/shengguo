import 'package:flutter/material.dart';

import '../config/http_config.dart';
import 'package:dio/dio.dart';

import '../services/screenAdapter.dart';
import '../routers/router.dart';
import 'dart:async';
import 'dart:convert';

class Category extends StatefulWidget {
  _Category createState() => _Category();
}

class _Category extends State<Category> with AutomaticKeepAliveClientMixin {
  int _selectIndex = 0;

  List _leftCataList = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _getLeftCataData();
  }

  _getLeftCataData() async {
    Options options = Options(headers: {'version': 'v2'});
    var apilist = "${config.base_url}api/category/tree";
    Response response;
    Dio dio = Dio();
    response = await dio.get(apilist, options: options);
    // var data = response.data.toString();
    // print(json.decode(response.data.toString()));
    setState(() {
      this._leftCataList = response.data['data']["tree"];
    });
  }

  // 分类左侧列表
  Widget _leftCateWidget() {
    if (this._leftCataList.length > 0) {
      return Container(
        width: 140,
        height: double.infinity, //高度自适应屏幕
        child: ListView.builder(
          itemCount: this._leftCataList.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      this._selectIndex = index;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: ScreenAdapter.height(80),
                    padding: EdgeInsets.only(top: ScreenAdapter.height(10)),
                    child: Text(
                      "${this._leftCataList[index]['name']}",
                      textAlign: TextAlign.center,
                    ),
                    color: _selectIndex == index
                        ? Color.fromRGBO(240, 246, 246, 1.0)
                        : Colors.white,
                  ),
                ),
                Divider(
                  height: 1,
                )
              ],
            );
          },
        ),
      );
    } else {
      return Container(
        width: 140,
        height: double.infinity, //高
      );
    }
  }

  // 分类右侧列表
  Widget _rightCateWidget() {
    if (this._leftCataList[this._selectIndex]['sub'][0]['sub'].length > 0) {
      return Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.all(ScreenAdapter.width(20)),
          height: double.infinity, //高度自适应屏幕
          color: Color.fromRGBO(240, 246, 246, 1.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1 / 1.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: _leftCataList[this._selectIndex]['sub'][0]['sub'].length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/goodsList',
                    arguments: {
                      "cid":
                          "${_leftCataList[this._selectIndex]['sub'][0]['sub'][index]['name']}"
                    },
                  );
                },
                child: Container(
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Image.network(
                          "${config.base_url}${_leftCataList[this._selectIndex]['sub'][0]['sub'][index]['icon']}",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: ScreenAdapter.height(40),
                        child: Text(
                          "${_leftCataList[this._selectIndex]['sub'][0]['sub'][index]['name']}",
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    } else {
      return Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.all(ScreenAdapter.width(20)),
          height: double.infinity, //高度自适应屏幕
          color: Color.fromRGBO(240, 246, 246, 1.0),
          child: Text('加载中'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Row(
      children: <Widget>[
        _leftCateWidget(),
        _rightCateWidget(),
      ],
    );
  }
}
