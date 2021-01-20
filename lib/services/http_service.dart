import 'package:dio/dio.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
// 获取用户token使用
import '../services/memberStorage.dart';
//  请求封装

class HttpRequest {
  // 设置请求头
  static BaseOptions options = BaseOptions(
    // 请求基地址,可以包含子路径，如: "https://zf.xianlady.com/".
    baseUrl: "https://zf.xianlady.com/",
    //连接服务器超时时间，单位是毫秒.
    connectTimeout: 50000,
    receiveTimeout: 30000,
    //  响应流上前后两次接受到数据的间隔，单位为毫秒。如果两次间隔超过[receiveTimeout]，
    //  [Dio] 将会抛出一个[DioErrorType.RECEIVE_TIMEOUT]的异常.
    //  注意: 这并不是接收数据的总时限.
    // 请求头，token
    headers: {
      'version': 'v2',
      'token': '',
      // 'token': ManberServices.getTokenData(),
      'Accept': 'application/json,*/*',
      'Content-Type': 'application/json',
    },
    //请求的Content-Type，默认值是[ContentType.json]. 也可以用ContentType.parse("application/x-www-form-urlencoded")
    //表示期望以那种格式(方式)接受响应数据。接受三种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
    responseType: ResponseType.json,
  );

  static Dio dio = Dio(options);

  // ignore: missing_return
  static Future<T> request<T>(String url,
      {String method = "get",
      Map<String, dynamic> params,
      Interceptor inter}) async {
    //1.请求的单独配置
    final options = Options(method: method);

    //2.添加第一个拦截器
    Interceptor dInter =
        InterceptorsWrapper(onRequest: (RequestOptions options) {
      //1. 在进行任何网络请求的时候，可以添加一个loading显示
      //2.很多页面的访问必须要求携带Token,那么就可以在这里判断是否有Token
      //3.对参数进行一些处理，比如序列化处理等
      // // 在发送请求之前做一些预处理
      // //我这边是在发送前到SharedPreferences（本地存储）中取出token的值，然后添加到请求头中
      //   //dio.lock()是先锁定请求不发送出去，当整个取值添加到请求头后再dio.unlock()解锁发送出去
      print("拦截了请求上传接口");
      dio.lock();
      Future<dynamic> future = Future(() async {
        return ManberServices.getTokenData();
      });
      return future.then((value) {
        print('11111111111111111111111111111111');
        print(value);
        options.headers["token"] = value;
        return options;
      }).whenComplete(() => dio.unlock());
    }, onResponse: (Response response) {
      // print("code = ${response.statusCode}");
      // print("拦截了响应$response");
      return response;
    }, onError: (DioError error) {
      // print("拦截了错误$error");
      return error;
    });

    List<Interceptor> inters = [dInter];
    if (inter != null) {
      inters.add(inter);
    }
    dio.interceptors.addAll(inters);

    //3.发送网络请求
    try {
      Response response = await dio.request<T>(url,
          data: FormData.fromMap(params), options: options);
      // print(response.toString());
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }

    // HttpRequest.request("https://httpbin.org/get",
    //     params: {"name": "why", 'age': 18}).then((res) {
    //   print(res);
    // });

    // HttpRequest.request("https://httpbin.org/post",
    //     method: "post", params: {"name": "why", 'age': 18}).then((res) {
    //   print(res);
    // });
  }
}
