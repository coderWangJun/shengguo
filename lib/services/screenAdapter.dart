import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter {
  static init(context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
  }

  static height(double value) {
    return ScreenUtil.getInstance().setHeight(value);
  }

  static width(double value) {
    return ScreenUtil.getInstance().setWidth(value);
  }

  static size(double size) {
    return ScreenUtil.getInstance().setSp(size);
  }

  static getScreenHeight() {
    return ScreenUtil.screenHeightDp;
  }

  static getScreenWidth() {
    return ScreenUtil.screenWidthDp;
  }

  static getScreenPxHeight() {
    return ScreenUtil.screenHeight;
  }

  static getScreenPxWidth() {
    return ScreenUtil.screenWidth;
  }
}
