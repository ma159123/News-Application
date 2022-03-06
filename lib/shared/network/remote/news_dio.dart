import 'package:dio/dio.dart';
class DioHelper {
  static Dio dio = Dio(); // with default Options

// new Dio with a BaseOptions instance.
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError:
            true, //يعني لو حصل ايرور والداتا راجعه يجيبها بردو
      ),
    );
  }

 static Future getData(
      {required String url, required Map<String, dynamic> query}) async {
    return await dio.get(url, queryParameters: query);
  }
}
