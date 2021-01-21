import 'package:flutter/material.dart';
import 'package:shengguo/services/screenAdapter.dart';
import 'package:shengguo/widget/iconFontWidget.dart';

/// appbar的左上角返回按钮组件
class AppbarLeading extends StatefulWidget {
  /// 重写组件
  final Widget myLeading;

  /// 返回事件
  final Function onTap;
  AppbarLeading({Key key, this.myLeading, this.onTap}) : super(key: key);

  @override
  _AppbarLeadingState createState() => _AppbarLeadingState();
}

class _AppbarLeadingState extends State<AppbarLeading> {
  @override
  Widget build(BuildContext context) {
    return widget.myLeading != null
        ? widget.myLeading
        : InkWell(
            child: Icon(
              IconfontsWidget.jiantouleft,
              color: Color.fromRGBO(255, 255, 255, 1.0),
              size: ScreenAdapter.width(36.0),
            ),
            onTap: widget.onTap != null
                ? widget.onTap
                : () => Navigator.pop(context),
          );
  }
}
