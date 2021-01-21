import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './provide/current_index_provide.dart';
import 'package:provide/provide.dart';
import './routers/router.dart';

void main() {
  var currentIndexProvide = CurrentIndexProvide();
  var providers = Providers();
  providers..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide));
  runApp(ProviderNode(child: MyApp(), providers: providers));

  if (Platform.isAndroid) {
    // 设置安卓头部导航透明
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: Kstring.appTitle, //app名称
      // theme: ThemeData(
      //   // 主题
      //   primaryColor: KColor.primaryColor,
      // ),
      // // home: Tabs(),
      title: '省果', //任务栏标题
      debugShowCheckedModeBanner: false, //右上角debug标签
      onGenerateRoute: onGenerateRoute, //路由生成器
      theme: ThemeData(
        // 主题
        primaryColor: Color.fromRGBO(255, 76, 65, 1),
        scaffoldBackgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          color: Color.fromRGBO(255, 66, 65, 1.0),
          brightness: Brightness.dark,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          ),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
        ),
      ),
      initialRoute: '/', //路由页面，
    );
  }
}
