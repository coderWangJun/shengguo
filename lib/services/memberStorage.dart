//用户数据

import 'package:flutter/material.dart';

import 'storage.dart';
import 'dart:convert';

class ManberServices {
  // 存储用户数据
  static setMemberData(memberdatavalue) async {
    await Storage.setString('memberdata', json.encode(memberdatavalue));
  }

  // 获取用户数据
  static getMemberData() async {
    try {
      // ignore: non_constant_identifier_names
      var MemberData = json.decode(await Storage.getString('memberdata'));
      return MemberData;
    } catch (e) {
      return [];
    }
  }

  // 存储token数据
  static setTokenData(tokendatavalue) async {
    await Storage.setString('tokendata', tokendatavalue);
  }

  // 获取token数据
  static getTokenData() async {
    try {
      // ignore: non_constant_identifier_names
      var tokendata = await Storage.getString('tokendata');
      return tokendata;
    } catch (e) {
      return [];
    }
  }

  // // 清空用户数据
  // static clearMemberData() async {
  //   await Storage.remove('memberData');
  // }

  // static removeHistoryData(keyWords) async {
  //   List searchListData = json.decode(await Storage.getString('memberData'));
  //   searchListData.remove(keyWords);
  //   await Storage.setString('memberData', json.encode([]));
  // }
}
