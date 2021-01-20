import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../services/screenAdapter.dart';
import '../../services/searchServices.dart';
import 'package:dio/dio.dart';
import '../../config/http_config.dart';

class SearchPage extends StatefulWidget {
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var _keyWords;

  List _historyListData = [];
  List _hotListData = [];
  void initState() {
    super.initState();
    this._getHistoryData();
    this._gethotSearchData();
  }

  _getHistoryData() async {
    this._historyListData = await SearchServices.getHistoryList();
    setState(() {
      this._historyListData = _historyListData;
    });
  }

  _gethotSearchData() async {
    Options options = Options(headers: {'version': 'v2'});
    var goodsListApi = '${config.base_url}api/goods_list/keyword';
    Response response;
    Dio dio = Dio();
    response = await dio.get(goodsListApi, options: options);
    // print(response.data["data"]["list"]);
    setState(() {
      this._hotListData = response.data["data"]["list"];
    });
  }

  _showAlertDialog(keyWords) async {
    var result = await showDialog(
        barrierDismissible: false, //表示点击灰色背景的时候是否消失弹出框
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示信息!"),
            content: Text("您确定要删除吗?"),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () {
                  print("取消");
                  Navigator.pop(context, 'Cancle');
                },
              ),
              FlatButton(
                child: Text("确定"),
                onPressed: () async {
                  //注意异步
                  await SearchServices.removeHistoryData(keyWords);
                  this._getHistoryData();
                  Navigator.pop(context, "Ok");
                },
              )
            ],
          );
        });

    //  print(result);
  }

  // 历史搜索数据
  Widget _historySearchData() {
    if (this._historyListData.length > 0) {
      return Wrap(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: this._historyListData.map((value) {
          return Container(
            // ignore: deprecated_member_use
            padding: EdgeInsets.all(ScreenAdapter.width(10)),
            margin: EdgeInsets.all(ScreenAdapter.width(10)),
            decoration: BoxDecoration(
              color: Color.fromRGBO(233, 233, 233, 0.9),
              borderRadius: BorderRadius.circular(
                ScreenAdapter.width(10),
              ),
            ),
            child: InkWell(
              child: Text("${value}"),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  "/goodsList",
                  arguments: {
                    "keyWords": "${value}",
                  },
                );
              },
              onLongPress: () {
                this._showAlertDialog("${value}");
              },
            ),
          );
        }).toList(),
      );
    } else {
      return Text("");
    }
  }

  // 热门搜索数据
  Widget _hotSearchData() {
    if (this._hotListData.length > 0) {
      return Wrap(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: this._hotListData.map((value) {
          return Container(
            // ignore: deprecated_member_use
            padding: EdgeInsets.fromLTRB(
              ScreenAdapter.width(60),
              ScreenAdapter.width(10),
              ScreenAdapter.width(60),
              ScreenAdapter.width(10),
            ),
            margin: EdgeInsets.all(ScreenAdapter.width(10)),
            decoration: BoxDecoration(
              color: Color.fromRGBO(233, 233, 233, 0.9),
              borderRadius: BorderRadius.circular(
                ScreenAdapter.width(10),
              ),
            ),
            child: InkWell(
              child: Text("${value["keyword"]}"),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  "/goodsList",
                  arguments: {
                    "keyWords": "${value["keyword"]}",
                  },
                );
              },
            ),
          );
        }).toList(),
      );
    } else {
      return Text("");
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              this._keyWords = value;
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
              if (this._keyWords != '') {
                SearchServices.setHistoryData(this._keyWords);
                Navigator.pushReplacementNamed(
                  context,
                  "/goodsList",
                  arguments: {
                    "keyWords": this._keyWords,
                  },
                );
              }
            },
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              // ignore: deprecated_member_use
              child: Text("历史搜索", style: Theme.of(context).textTheme.title),
            ),
            _historySearchData(),
            SizedBox(height: ScreenAdapter.height(10)),
            Container(
              child: Text("热门搜索"),
            ),
            SizedBox(height: ScreenAdapter.height(10)),
            _hotSearchData(),
          ],
        ),
      ),
    );
  }
}
