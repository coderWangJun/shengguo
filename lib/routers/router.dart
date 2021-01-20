import 'package:flutter/material.dart';

import '../pages/tabs.dart'; //tab切换
import '../pages/home/search_page.dart'; //商品列表
import '../pages/home/goodsList.dart'; //商品列表
import '../pages/activity/freePurchase.dart'; //零元购页面
//我的部分页面
import '../pages/my/order.dart'; //订单页面
import '../pages/my/cashOut.dart'; //提现页面
import '../pages/my/cashOutList.dart'; //提现列表页面
import '../pages/my/cashOutDetails.dart'; //提现页面
import '../pages/my/commonProblem.dart'; //常见问题
import '../pages/my/notice.dart'; //官方公告
import '../pages/my/kefu.dart'; //联系客服
import '../pages/my/suggestions.dart'; // 投诉建议
import '../pages/my/collection.dart'; //收藏
import '../pages/my/myfans.dart'; //我的粉丝
import '../pages/my/invite.dart'; //邀请赚钱
import '../pages/my/setting.dart'; //设置页面
import '../pages/my/aboutUs.dart'; //关于我们页面
import '../pages/my/agreement.dart'; //协议页面
//登录
import '../pages/login/login.dart'; //登录页面
// 教程规则部分
import '../pages/rule/course.dart'; //省钱教程

//配置路由
final routes = {
  '/': (context) => Tabs(),
  // 搜索页面
  '/search': (context) => SearchPage(),
  // 商品列表
  '/goodsList': (context, {arguments}) => GoodsListPage(arguments: arguments),
  // 零元购
  '/freePurchase': (context) => FreePurchasePage(),
  // 省钱教程
  '/course': (context, {arguments}) => CoursePage(arguments: arguments),
  // 登录
  '/login': (context) => LoginOptions(),

  // 提现页面
  '/cashOut': (context) => CashOut(),
  // 提现列表
  '/cashOutList': (context) => CashOutList(),
  // 提现详情
  '/cashOutDetails': (context, {arguments}) =>
      CashOutDetails(arguments: arguments),
  //订单页面
  '/order': (context, {arguments}) => OrderPage(arguments: arguments),
  // 常见问题
  '/commonProblem': (context) => CommonProblemPage(),
  // 官方公告
  '/notice': (context) => NoticePage(),
  // 联系客服
  '/kefu': (context) => KefuPage(),
  // 投诉建议
  '/suggestions': (context) => SuggestionsPage(),
  // 收藏
  '/collection': (context) => CollectionPage(),
  // 我的粉丝
  '/myFans': (context) => MyFansPage(),
  // 邀请赚钱
  '/invite': (context) => InvitePage(),
  // 设置
  '/setting': (context) => SettingOptions(),
  // 关于我们
  '/aboutUs': (context) => AboutUsOptions(),
  // 用户协议or隐私协议
  '/agreement': (context, {arguments}) =>
      AgreementOptions(arguments: arguments),
};

//固定写法

var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      // 有跳转参数;
      final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments),
      );
      return route;
    } else {
      // 无跳转参数;
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
