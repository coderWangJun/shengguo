import 'storage.dart';
import 'dart:convert';

class SearchServices {
  static setHistoryData(keyWords) async {
    try {
      List searchListdata = json.decode(await Storage.getString("searchList"));
      var hasData = searchListdata.any((v) {
        return v == keyWords;
      });
      if (!hasData) {
        searchListdata.add(keyWords);
        await Storage.setString('searchList', json.encode(searchListdata));
      }
    } catch (e) {
      List tempList = new List();
      tempList.add(keyWords);
      await Storage.setString('searchList', json.encode(tempList));
    }
  }

  static getHistoryList() async {
    try {
      List searchListData = json.decode(await Storage.getString('searchList'));
      return searchListData;
    } catch (e) {
      return [];
    }
  }

  static clearHistoryList() async {
    await Storage.remove('searchList');
  }

  static removeHistoryData(keyWords) async {
    List searchListData = json.decode(await Storage.getString('searchList'));
    searchListData.remove(keyWords);
    await Storage.setString('searchList', json.encode([]));
  }
}
