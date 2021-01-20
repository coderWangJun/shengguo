import 'package:flutter/material.dart'; //flutter的库（fimt）;
import './home_page.dart';
import './task_page.dart';
import './news_page.dart';
import './my_page.dart';
// import './category.dart';
import 'package:flutter/services.dart';

import '../services/screenAdapter.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    this._pageController = new PageController(initialPage: this._currentIndex);
  }

  List<Widget> _pageList = [
    HomePage(), //首页
    TaskPage(), //签到
    // Category(), //分类
    NewsPage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    //   statusBarColor: Color.fromRGBO(255, 76, 65, 1.0),
    // );
    // SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    ScreenAdapter.init(context);
    return Scaffold(
      body: PageView(
        controller: this._pageController,
        children: this._pageList,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex, //tab默认选中项
        onTap: (index) {
          //tab点击方法，index为点击的索引
          setState(() {
            this._currentIndex = index;
            this._pageController.jumpToPage(this._currentIndex);
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Color.fromRGBO(255, 76, 65, 1.0), //tab切换选中颜色
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon/tabbar_icon_home_normal.png',
              width: 16,
              height: 16,
            ),
            activeIcon: Image.asset(
              'assets/icon/tabbar_icon_home_selected.png',
              width: 16,
              height: 16,
            ),
            title: Text(
              "首页",
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon/tabbar_icon_task_normal.png',
              width: 16,
              height: 16,
            ),
            activeIcon: Image.asset(
              'assets/icon/tabbar_icon_task_selected.png',
              width: 16,
              height: 16,
            ),
            title: Text(
              "签到",
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon/tabbar_icon_classification_normal.png',
              width: 16,
              height: 16,
            ),
            activeIcon: Image.asset(
              'assets/icon/tabbar_icon_classification_selected.png',
              width: 16,
              height: 16,
            ),
            title: Text(
              "消息",
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon/tabbar_icon_mine_normal.png',
              width: 16,
              height: 16,
            ),
            activeIcon: Image.asset(
              'assets/icon/tabbar_icon_mine_selected.png',
              width: 16,
              height: 16,
            ),
            title: Text(
              "我的",
            ),
          ),
        ], //点击事件
      ),
    );
  }
}
