import 'package:dio/dio.dart';

class Client {
  static const _baseUrl = "http://10.0.2.2:8000/";
  static final Dio dio = Dio(BaseOptions(baseUrl: _baseUrl));
}
