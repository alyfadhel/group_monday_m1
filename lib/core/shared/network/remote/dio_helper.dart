import 'package:dio/dio.dart';

class ShopDioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    Map<String,dynamic>?data,
    String lang = 'en',
    String? token,
  })
  async {
    dio.options.headers = {
      'Content-Type' : 'application/json',
      'lang' : lang,
      'Authorization' : token ?? '',
    };
    return await dio.get(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String,dynamic>data,
    String lang = 'en',
    String? token,
  })
  async {
    dio.options.headers = {
      'Content-Type' : 'application/json',
      'lang' : lang,
      'Authorization' : token ?? '',
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String,dynamic>data,
    String lang = 'en',
    String? token,
  })
  async {
    dio.options.headers = {
      'Content-Type' : 'application/json',
      'lang' : lang,
      'Authorization' : token ?? '',
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}

/////////////////////////////////////////////////////////////

class NewsDioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}
