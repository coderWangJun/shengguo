import 'package:flutter_screenutil/flutter_screenutil.dart';
// 屏幕适配
import 'package:provide/provide.dart';
import 'package:flutter/material.dart';
import '../config/index.dart';
import 'home_page.dart';
import 'task_page.dart';
import 'news_page.dart';
import 'my_page.dart';
import '../provide/current_index_provide.dart';

class IndexPage extends StatelessWidget {
  // 底部导航栏
  final List<BottomNavigationBarItem> bottomTabs = [
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
      title: Text(Kstring.homeTitle),
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
      title: Text(Kstring.taskTitle),
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
      title: Text(Kstring.newTitle),
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
      title: Text(Kstring.myTitle),
    ),
  ];

  final List<Widget> tabBodies = [
    HomePage(),
    TaskPage(),
    NewsPage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // 屏幕适配
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Provide<CurrentIndexProvide>(builder: (context, child, val) {
      //获取当前索引状态值
      int currentIndex =
          Provide.value<CurrentIndexProvide>(context).currentIndex;
      return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex, //当前选中索引
          type: BottomNavigationBarType.fixed, //布局类型
          selectedLabelStyle: TextStyle(fontSize: 12.0), //选中文字样式
          unselectedLabelStyle: TextStyle(fontSize: 12.0), //未选中文字样式
          items: bottomTabs, //条目
          onTap: (index) {
            Provide.value<CurrentIndexProvide>(context).changeIndex(index);
          }, //点击事件
        ),
        body: IndexedStack(
          index: currentIndex,
          children: tabBodies,
        ),
      );
    });
  }
}
